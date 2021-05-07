class BakersController < ApplicationController
  def index
    @bakers = Baker.all
  end
end
