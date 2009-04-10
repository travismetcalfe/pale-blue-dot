#############################################################
#	Application
#############################################################

set :application, "pale_blue_dot"
set :deploy_to, "/var/www/pale-blue-dot.sprovoost.nl"

#############################################################
#	Settings
#############################################################

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :use_sudo, false
set :scm_verbose, true
set :rails_env, "production" 

#############################################################
#	Servers
#############################################################

set :domain, "sprovoost.nl"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################

set :scm, "git"
set :repository, "git@github.com:Sjors/pale-blue-dot.git "
#set :deploy_via, :remote_cache
#set :branch, "master"


