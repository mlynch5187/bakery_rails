class BakersController < ApplicationController
  def index
    @bakers = Baker.all
  end

  def show
    @baker = Baker.find(params[:id])
  end

  def destroy
    baker = Baker.find(params[:id])
    baker.destroy
    redirect_to "/bakers"
  end
end
