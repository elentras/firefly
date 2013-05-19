# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
set :output, "#{path}/log/cron.log"
set :whenever_environment, defer { stage }
set :whenever_identifier, defer { "#{application}_#{stage}" }
set :whenever_command, "bundle exec whenever"
set :whenever_variables, defer { "'environment=#{rails_env}&current_path=#{current_path}'" }
require 'whenever/capistrano'

every 1.minutes do
  rake "cron:update", environment: "production"
end