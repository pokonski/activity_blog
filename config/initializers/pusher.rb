config_path = File.join(Rails.root, 'config/pusher.yml')
pusher = {}
if File.exists? config_path
  pusher = YAML.load(File.read(config_path))
end
Pusher.app_id = ENV["PUSHER_APP_ID"] || pusher["app_id"]
Pusher.key    = ENV["PUSHER_KEY"]    || pusher["key"]
Pusher.secret = ENV["PUSHER_SECRET"] || pusher["secret"]