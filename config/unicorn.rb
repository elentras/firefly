root = "/data/www/firefly/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn_stderr.log"
stdout_path "#{root}/log/unicorn_stdout.log"

listen "/tmp/unicorn.firefly.sock"
worker_processes 2
timeout 30