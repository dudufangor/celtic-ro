# Requires
require 'bundler/setup'
require 'capistrano/ext/multistage'
require 'rvm/capistrano'

# General
set :application, 'celtic_ro'
set :use_sudo, false
set :user, 'root'

# Repository
set :deploy_to, '/root/celtic_ro/'
set :repository, 'git@github.com:dudufangor/celtic-ro.git'
set :scm, :git
set :normalize_asset_timestamps, false

# Rvm
set :rvm_ruby_string, 'ruby-2.1.2@celtic_ro'
set :rvm_type, :system

# Flow
after 'deploy:update_code', 'deploy:copy_config_files', 'deploy:bundle'

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
  end

  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

  after "deploy:finalize_update", "deploy:symlink_config"

  task :bundle do
    run "cd #{ release_path } && LC_ALL='en_US.UTF-8' RAILS_ENV='#{ environment }' bundle install --without test development"
  end

  desc 'Copy config files like database.yml and .rvmrc'
  task :copy_config_files do
    run "cp #{ release_path }/config/server/rvmrc #{ release_path }/.rvmrc"
  end
end