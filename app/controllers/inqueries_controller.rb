class InqueriesController < ApplicationController
  def create
    @inquery = Inquery.new(inquery_params)
    if @inquery.save
      flash[:complete] = "Thanks! You'll be receiving an email shortly with membership information."
    else
      flash[:error] = "We're sorry, something went wrong. Please try again."
    end
    redirect_to root_path
  end

  private

  def inquery_params
    params.require(:inquery).permit(:name, :email, :zipcode, :referral_source, :referral_code)
  end
end