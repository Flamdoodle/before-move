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

  def destroy
    session.clear
    redirect_to root_path
  end
end