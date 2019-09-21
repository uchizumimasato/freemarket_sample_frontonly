Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Rails.application.credentials.facebook[:app_id], Rails.application.credentials.facebook[:app_secret_id]
  provider :google_oauth2, Rails.application.credentials.google[:client_id], Rails.application.credentials.google[:client_secret_id]
end
