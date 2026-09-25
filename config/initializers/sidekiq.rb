url = Rails.application.credentials.dig("redis", "url")
password = Rails.application.credentials.dig("redis", "password")
Sidekiq.configure_server do | config | 
  config.redis = { url: url, password: password }
end 

Sidekiq.configure_client do | config |
  config.redis = { url: url, password: password }
end 
