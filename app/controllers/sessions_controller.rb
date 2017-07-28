class SessionsController < ApplicationController

	def create
    @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.name = auth['info']['name']
      u.email = auth['info']['email']
      u.image = auth['info']['image']
    end
    @auth = auth
    session[:user_id] = @user.id
 
    render 'sessions/create'
  end
 
  private
 
  def auth
    request.env['omniauth.auth']
    end
end