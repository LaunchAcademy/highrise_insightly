require "bundler/gem_tasks"
require 'rspec/core/rake_task'

task :console do
  require 'irb'
  require 'irb/completion'

  begin
    require 'dotenv'
    Dotenv.load
  rescue LoadError
  end

  require File.join(File.dirname(__FILE__), 'lib/highrise_insightly')
  ARGV.clear
  IRB.start
end

desc "Run all specs in spec directory"
RSpec::Core::RakeTask.new(:spec)

task default: :spec

