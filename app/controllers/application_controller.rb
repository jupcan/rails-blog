class ApplicationController < ActionController::Base
     before_action :authenticate_user!, only: [:create, :destroy, :edit]
     protect_from_forgery with: :exception
     helper_method :current_user, :logged_in?
end
