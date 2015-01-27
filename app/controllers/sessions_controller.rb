class SessionsController < ApplicationController
  def new
  end

  def create
    @member = Member.find_by(email: params[:email])
    if @member.authenticate(params[:password])
      session[:member_id] = @member.id
      redirect_to root_path
    else
      flash[:error] = @member.errors.full_messages
      redirect_to login_path
    end
  end

  def create_facebook
    auth = env["omniauth.auth"]
    current_member.facebook_token = auth.credentials.token
    current_member.facebook_token_expires_at = Time.at(auth.credentials.expires_at)
    flash[:error] = current_member.errors.full_messages unless current_member.save
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end