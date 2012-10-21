pusher = YAML.load(File.read(File.join(Rails.root, 'config/pusher.yml')))
Pusher.app_id = ENV["PUSHER_APP_ID"] || pusher["app_id"]
Pusher.key    = ENV["PUSHER_KEY"]    || pusher["key"]
Pusher.secret = ENV["PUSHER_SECRET"] || pusher["secret"]