Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'
    resource '/api-docs/*', headers: :any, methods: [:get, :head]
    resource '/webhooks/*', headers: :any, methods: [:post, :options]
  end
end
