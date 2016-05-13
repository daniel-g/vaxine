class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  # En caso que users sea una interfaz compartida para muchas vistas,
  # puede colocarse en la clase padre
  def users
    @users = User.all
  end
  helper_method :users
end
