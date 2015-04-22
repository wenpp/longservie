# Set the current app's path for later reference.
app_path = File.expand_path(File.dirname(__FILE__) + '/..')

# Set the working application directory
#working_directory "/var/www/my_app"
working_directory app_path
# Unicorn PID file location
#pid "/var/www/my_app/pids/unicorn.pid"
pid app_path+"/tmp/pids/unicorn.pid"

# Path to logs
# stderr_path "/path/to/log/unicorn.log"
# stdout_path "/path/to/log/unicorn.log"
stderr_path app_path+ "/log/unicorn.log"
stdout_path app_path+ "/log/unicorn.log"

# You can listen on a port or a socket. Listening on a socket is good in a
# production environment, but listening on a port can be useful for local
# debugging purposes.
listen app_path + '/tmp/unicorn.longservice.sock'

# For development, you may want to listen on port 3000 so that you can make sure
# your unicorn.rb file is soundly configured.
#listen(3000, backlog: 64) if ENV['RAILS_ENV'] == 'development'
listen 80, :tcp_nopush => false

# Number of processes
worker_processes 1

# Time-out
timeout 300

# Load the app up before forking.
preload_app true

# Garbage collection settings.
GC.respond_to?(:copy_on_write_friendly=) &&
  GC.copy_on_write_friendly = true

# If using ActiveRecord, disconnect (from the database) before forking.
before_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.connection.disconnect!
end

# After forking, restore your ActiveRecord connection.
after_fork do |server, worker|
  defined?(ActiveRecord::Base) &&
    ActiveRecord::Base.establish_connection
end