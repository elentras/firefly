namespace :cron do
  desc "Launch updates"
  task :update => [:environment] do
    Cron::Torrent.update
  end

  desc "Sync torrent list with transmission server"
  task :sync => [:environment] do
    Cron::Torrent.sync
  end

end