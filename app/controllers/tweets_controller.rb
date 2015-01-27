class TweetsController < ApplicationController
  def new
  end

  def create
    current_member.tweet(twitter_params[:message])
    redirect_to root_path
  end

  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end