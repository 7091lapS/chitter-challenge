
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require './app/data_mapper_setup'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec


task default: [:cop, :spec]


task :auto_migrate do
  DataMapper.auto_migrate!
  puts "Migration successful"
end
