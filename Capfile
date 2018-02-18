# frozen_string_literal: true

require 'capistrano/setup'

require 'capistrano/deploy'

require 'capistrano/scm/git'
install_plugin Capistrano::SCM::Git

require 'capistrano/rails'
require 'capistrano/passenger'

require 'capistrano/rvm'
set :rvm_type, :user
set :rvm_ruby_version, '2.4.0'

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
