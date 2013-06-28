class SessionsController < ApplicationController
  def create
    auth_response = env['omniauth.auth']
    user = User.find_or_create_by(uid: auth_response['uid']) do |user|
      user.name = auth_response['info']['name']
      user.email = auth_response['info']['email']
    end
    session['user_id'] = user.id
    redirect_to root_path
  end
end
