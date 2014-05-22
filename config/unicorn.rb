# Set the working application directory
# working_directory '/path/to/your/app'
working_directory '/root/celtic_ro/current'

# Unicorn PID file location
# pid '/path/to/pids/unicorn.pid'
pid '/root/celtic_ro/current/pids/unicorn.pid'

# Path to logs
# stderr_path '/path/to/log/unicorn.log'
# stdout_path '/path/to/log/unicorn.log'
stderr_path '/root/celtic_ro/current/log/unicorn.log'
stdout_path '/root/celtic_ro/current/log/unicorn.log'

# Unicorn socket
listen '/tmp/unicorn.[app name].sock'
listen '/tmp/unicorn.celtic_ro.sock'

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30