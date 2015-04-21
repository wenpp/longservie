# Set the working application directory
working_directory "/var/www/longservice"
# Unicorn PID file location
pid "/var/www/longservice/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path "/var/www/longservice/log/unicorn.log"
stdout_path "/var/www/longservice/log/unicorn.log"

# Unicorn socket
listen "/tmp/unicorn.longservice.sock"

# Number of processes
worker_processes 1

# Time-out
timeout 30