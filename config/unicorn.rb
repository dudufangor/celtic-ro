# Set the working application directory
# working_directory '/path/to/your/app'
root = '/root/celtic_ro/current'
working_directory root

# Unicorn PID file location
# pid '/path/to/pids/unicorn.pid'
pid "#{ root }/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path '/path/to/log/unicorn.log'
# stdout_path '/path/to/log/unicorn.log'
stderr_path "#{ root }/log/unicorn.log"
stdout_path "#{ root }/log/unicorn.log"

# Unicorn socket
listen '/tmp/unicorn.celtic_ro.sock'

# Number of processes
# worker_processes 4
worker_processes 2

# Time-out
timeout 30

before_exec do |_|
  ENV["BUNDLE_GEMFILE"] = File.join(root, 'Gemfile')
end