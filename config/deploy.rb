# config valid only for Capistrano 3.1
lock '3.10.0'

set :application, 'gem_server'
set :repo_url, 'git@github.com:amplion/gem_server.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
# set :deploy_to, '/var/www/my_app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
set :pty, true

# Set ENV['DEPLOY_KEY'] to somepath/your_key.pem, for example
if (ENV['DEPLOY_KEY'] && !ENV['DEPLOY_KEY'].empty?)
  set :ssh_options, {
    forward_agent: true,
    auth_methods: ["publickey"],
    keys: [ENV['DEPLOY_KEY']]
  }
end

# Default value for :linked_files is []
set :linked_files, %w{.env}

# Default value for linked_dirs is []
set :linked_dirs, %w{tmp log}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

set :rbenv_ruby, '2.4.1'

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart

end
