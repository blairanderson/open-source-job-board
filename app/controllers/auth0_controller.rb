class Auth0Controller < ApplicationController
  def callback
    # This stores all the user information that came from Auth0
    # and the IdP
    session[:userinfo] = request.env['omniauth.auth'].as_json
    User.where(email: Hash(session[:userinfo]).dig("info", "email")).first_or_create!

    # Redirect to the URL you want after successful auth
    redirect_to root_path
  end

  def failure
    # show a failure page or redirect to an error page
    @error_msg = request.params['message']
  end
end
