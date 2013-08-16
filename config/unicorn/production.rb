listen "/tmp/.tasks_sock", :backlog => 64
pid "/apps/tasks/shared/pids/unicorn.pid"

stderr_path "/apps/tasks/shared/log/unicorn.stderr.log"
stdout_path "/apps/tasks/shared/log/unicorn.stdout.log"

