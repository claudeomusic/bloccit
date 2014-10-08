# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Bloccit::Application.config.secret_key_base = ENV['SECRET_TOKEN']