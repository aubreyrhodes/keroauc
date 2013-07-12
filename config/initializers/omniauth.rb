Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, EnvVars.google_consumer_key, EnvVars.google_consumer_secret
end
