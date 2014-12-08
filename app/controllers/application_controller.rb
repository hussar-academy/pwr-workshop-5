class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include JsEnv

  helper_method :current_user

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = User.find_or_create_by!(
      email: 'user@example.com'
    )
  end
end
