class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def helle
      render  html:"Hello,World"
  end
end
