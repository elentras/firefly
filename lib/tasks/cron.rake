namespace :cron do
  desc "Launch updates"
  task :update => [:environment] do
    Cron::Torrent.update
  end
end