# config valid only for Capistrano 3.1
lock '3.4.0'

# Configure these values
set :application, "fivestarstove"
set :repo_url, "git@gitlab.com:yamzalal/5starstove.git"
set :deploy_to, "/var/www/#{fetch(:application)}"

# Don't remove the existing values as it's needed for capistrano-bolt to work
# You may add more files or directories to this list if needed.
set :linked_files, %w{.env config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

## Changes these default values only if needed

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
