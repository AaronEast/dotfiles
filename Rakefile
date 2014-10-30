require 'fileutils'

# Files
def setup
  @dfdir = '~/dotfiles'
  @files ||= Dir.entries( File.expand_path( @dfdir ) ) - $exclude
  @repo = 'https://github.com/AaronEast/dotfiles.git'
end

# Repo

# Files and folders which shouldn't be copied over
$exclude = [
  '.',
  '..',
  '.git',
  '.gitignore',
  'bootstrap.sh',
  'Gemfile',
  'Gemfile.lock',
  'Rakefile',
  'README.md'
]

desc 'Update dotfiles repository.'
task :update do
  system "git clone #{@repo}"
end

desc 'Run all install tasks in order.'
task :install => [ 'install:deps', 'install:copy', 'install:post' ]

namespace :install do

  desc 'Get Deps.'
  task :deps do
    setup
  end

  desc 'Copy dotfiles over to home dir.'
  task :copy do
    entries.each do | file |
      FileUtils.cp_r file, File.expand_path( "~/#{file}" ), :verbose => true, :remove_destination => true
    end
  end

  desc 'Run post-install tasks.'
  task :post do
    FileUtils.rm_f File.expand_path( @dfdir ), :verbose => true
  end

end
