require "bundler/capistrano"
require 'capistrano-unicorn'

set :application, "tasks"
set :repository,  "git@github.com:aubreyrhodes/keroauc.git"

role :web, "dev.acrhodes.com"                          # Your HTTP server, Apache/etc
role :app, "dev.acrhodes.com"                          # This may be the same as your `Web` server
role :db,  "dev.acrhodes.com", :primary => true # This is where Rails migrations will run

set :branch, "master"
set :deploy_via, :remote_cache
set :user, "deployer"
set :deploy_to, "/apps/tasks"
set :use_sudo, false
set :normalize_asset_timestamps, false
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

default_run_options[:shell] = '/bin/zsh -i'
after 'deploy:restart', 'unicorn:restart'

set :unicorn_config_path, "config/unicorn"
set :unicorn_config_filename, "production.rb"
