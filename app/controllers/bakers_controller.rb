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

  def new; end

  def create
    baker = Baker.create(baker_params)
    if baker.save
      redirect_to "/bakers"
    else
      flash[:notice] = "Please fill out all fields and give the baker a unique name"
      redirect_to "/bakers/new"
    end
  end

  def edit
    @baker = Baker.find(params[:id])
  end

  private

  def baker_params
    params.permit(:name, :job, :age)
  end
end
