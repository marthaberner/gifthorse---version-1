class GiftsController < ApplicationController


  def create
    @gifts = Gift.all
    @gift = Gift.create(gift_params)

    if @gift.save
      redirect_to gift_path(@gift.id)
    else
      render '/'
    end
  end

  def show
    @gifts = Gift.all
    @gift = Gift.find(params[:id])
  end


  def gift_params
    params.require(:gift).permit(:nickname, :url)
  end
end