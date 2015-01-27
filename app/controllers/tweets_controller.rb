class TweetsController < ApplicationController
  def new
  end

  def create
    current_member.tweet(twitter_params[:message])
  end

  private

  def twitter_params
    params.require(:tweet).permit(:message)
  end
end