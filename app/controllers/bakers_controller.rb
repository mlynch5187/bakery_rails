class BakersController < ApplicationController
  def index
    @bakers = Baker.all
  end

  def show
    @baker = Baker.find(params[:baker_id])
  end
end
