# ensure sandbox 
Quickbooks.sandbox_mode = !Rails.env.production?

QBO_OAUTH_CLIENT = OAuth2::Client.new(
  Rails.application.credentials.dig("qb", 'client_id'),
  Rails.application.credentials.dig('qb', 'client_secret'),
  site: 'https://appcenter.intuit.com',
  authorize_url: "https://appcenter.intuit.com/connect/oauth2",
  token_url: "https://oauth.platform.intuit.com/oauth2/v1/tokens/bearer"
)
