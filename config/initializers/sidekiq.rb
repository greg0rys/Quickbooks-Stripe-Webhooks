creds = Rails.application.credentials.redis 
redis_config = {
  url: creds[:url],
  password: creds[:password]
}
Sidekiq.configure_server do | config | 
  config.redis = redis_config 
end 

Sidekiq.configure_client do | config |
  config.redis = redis_config 
end 
