class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  private

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def render_404
    render nothing: true, status: 404
  end
end
