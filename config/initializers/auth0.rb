Rails.application.config.middleware.use OmniAuth::Builder do
  provider(
    :auth0,
    '1cx1V2oP5p3vkxIIgn6qGTbAPlcX9fxd',
    'dRcTNYHQkIX95U_Jnnx1S7QkeU-CDc7h64xzWafyMo040vgo5j8nGLmmLr8wr91-',
    'partydrone.auth0.com',
    callback_path: '/auth/auth0/callback',
    authorize_params: {
      scope: 'openid email profile'
    }
  )
end
