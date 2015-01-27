class TweetsController < ApplicationController
  def create
    current_member.tweet(twitter_params[:message])
    flash[:error] = "Tweet sent!"
    redirect_to root_path
  end

  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end