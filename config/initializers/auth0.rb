Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    ENV.fetch('AUTH0_CLIENT'),
    ENV.fetch('AUTH0_SECRET'),
    ENV.fetch('AUTH0_DOMAIN'),
    callback_path: '/auth/auth0/callback',
    authorize_params: {scope: 'openid email profile'}
  )
end
