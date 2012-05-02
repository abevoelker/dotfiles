# Based on Ryan Bates's original @ https://github.com/ryanb/dotfiles

require 'rake'
require 'erb'
require 'fileutils'

EXCLUDED_FILES = %w[Rakefile README.rdoc LICENSE]

desc "install the dot files into user's home directory"
task :install do
  puts "Populating submodules..."
  system %{git submodule init && git submodule update}

  replace_all = false
  Dir['*'].each do |file|
    next if EXCLUDED_FILES.include? file
    
    if File.exist?(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"))
      if File.identical? file, File.join(ENV['HOME'], ".#{file.sub('.erb', '')}")
        puts "identical ~/.#{file.sub('.erb', '')}"
      elsif replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file.sub('.erb', '')}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file.sub('.erb', '')}"
        end
      end
    else
      link_file(file)
    end
  end

  # Make ~/bin symlinks
  user_bin = File.join(ENV['HOME'], 'bin')
  FileUtils.mkdir user_bin unless File.exists? user_bin
  # vless
  system %Q{ln -s "/usr/share/vim/vim73/macros/less.sh" "$HOME/bin/vless"}
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file.sub('.erb', '')}"}
  link_file(file)
end

def link_file(file)
  if file =~ /.erb$/
    puts "generating ~/.#{file.sub('.erb', '')}"
    File.open(File.join(ENV['HOME'], ".#{file.sub('.erb', '')}"), 'w') do |new_file|
      new_file.write ERB.new(File.read(file)).result(binding)
    end
  else
    puts "linking ~/.#{file}"
    system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
  end
end
