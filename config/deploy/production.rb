#############################################################
#	Application
#############################################################

set :application, "pale_blue_dot"
set :deploy_to, "/home/sjors/wizard.whitedwarf.org"

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

set :domain, "grizzlies.dreamhost.com"
server domain, :app, :web
role :db, domain, :primary => true

#############################################################
#	Git
#############################################################

set :scm, "git"
set :repository, "git@github.com:Sjors/pale-blue-dot.git "
#set :deploy_via, :remote_cache
#set :branch, "master"


