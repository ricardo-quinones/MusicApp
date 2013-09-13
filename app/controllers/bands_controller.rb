class BandsController < ApplicationController
  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
    @albums = @band.albums
  end

  def new
    @band = Band.new
  end

  def edit
    @band = current_band
  end

  def create
    @band = Band.new(params[:band])
    if @band.save
      redirect_to band_url(@band)
    else
      flash[:notice] = "That band has already been added."
      render :new
    end
  end

  def update
    current_band.update_attributes(params[:band])
    redirect_to band_url(current_band)
  end

  def destroy
    Band.delete(params[:id])

    redirect_to bands_url
  end

  private

  def current_band
    @current_band ||= Band.find(params[:id])
  end
end
