config_path = File.join(Rails.root, 'config/pusher.yml')
if File.exists? config_path
  pusher = YAML.load(File.read(config_path))
  Pusher.app_id = pusher["app_id"]
  Pusher.key    = pusher["key"]
  Pusher.secret = pusher["secret"]
end
