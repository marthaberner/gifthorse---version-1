class GiftsController < ApplicationController

  def index
    @gifts = Gift.all

  end

  def new

  end

  def create
    @gift = Gift.new
    @gift.gift_url = params[:gift][:gift_url]
    @gift.nickname = params[:gift][:nickname]
    @gift.save

    redirect_to '/gifts'
  end
end