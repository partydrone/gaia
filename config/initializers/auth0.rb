Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    'wKu5QG0h0zbtxPULIjR37vLI5x3L3e3h',
    'cMXFTxAG1lIlQp_Bpp6dowYoJhQfYYYXnK_pfO0YlKfgJezYS3yKwOmtQ2i2b5B6',
    'phoenix-dev.auth0.com',
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid email profile',
      audience: 'https://phoenix-dev.auth0.com/userinfo'
    }
  )
end
