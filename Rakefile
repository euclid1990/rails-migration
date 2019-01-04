require 'rubygems'
require 'erb'
require "active_record"
require "rails/generators"

include ActiveRecord::Tasks

class SeedLoader
  def initialize(seed_file)
    @seed_file = seed_file
  end
  def load_seed
    raise "Seed file '#{@seed_file}' does not exist" unless File.file?(@seed_file)
    load @seed_file
  end
end

DatabaseTasks.env = ENV['ENV'] || 'development'
DatabaseTasks.root = File.dirname(__FILE__)
DatabaseTasks.database_configuration = YAML.load(ERB.new(File.read('database.yml')).result)
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths= 'db/migrate'
DatabaseTasks.seed_loader = SeedLoader.new('db/seeds.rb')

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.database_configuration
  ActiveRecord::Base.establish_connection DatabaseTasks.env.to_sym
end

namespace :db do
  desc "Creates a new migration file with the specified name"
  task :generate, :name, :options do |t, args|
    name, options = args[:name] || ENV['name'], args[:options] || ENV['options']
    unless name
      puts "Error: must provide name of migration to generate."
      puts "For example: rake #{t.name} name=add_field_to_form"
      abort
    end

    if options
      generator_params = [name] + options.gsub('/', ' ').split(" ")
    else
      generator_params = [name]
    end
    Rails::Generators.invoke "active_record:migration", generator_params, :destination_root => DatabaseTasks.migrations_paths
  end
end

load 'active_record/railties/databases.rake'