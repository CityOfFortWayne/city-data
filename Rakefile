lib = File.expand_path('../scripts/lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems'
require 'bundler/setup'
require 'active_support/all'

Bundler.require(:default)

require 'crime/fwpd'

ROOT_PATH = File.dirname(__FILE__)

load './scripts/lib/tasks/crime.rake'
