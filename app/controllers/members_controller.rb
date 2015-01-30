class MembersController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      session[:user_id] = @member.id
      @member.last_login = Time.now
      redirect_to root_path
    else
      flash[:error] = @member.errors.full_messages.join(" & ")
      redirect_to root_path
    end
  end

  private

  def member_params
    params.require(:member).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone_number, :zipcode)
  end
end