class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper  
end

def cur_user
	@cur_user ||= User.find(session[:user_id]) if session[:user_id]
end


def authorize
	redirect_to '/login' unless cur_user
end