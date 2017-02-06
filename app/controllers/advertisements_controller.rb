class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
  end

  def new
    @advertisement = Advertisement.new
  end

  def edit
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.body = params[:advertisement][:body]
    @advertisement.price = params[:advertisement][:price]

    if @advertisement.save
      flash[:notice] = "Advertisement was saved"
      redirect_to @advertisement
    else
      flash.now[:alert] = "There was an error trying to save the advertisement.Please try again later"
      render :new
    end
  end
end
