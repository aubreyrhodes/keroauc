class SessionsController < ApplicationController
  def create
    session['user_id'] = env['omniauth.auth']['uid']
    redirect_to root_path
  end
end
