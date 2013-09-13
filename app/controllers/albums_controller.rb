class AlbumsController < ApplicationController
  def index
    @band = Band.find(params[:band_id])
    @band_albums = Album.where(band_id: @band.id)
  end

  def new

  end

  def edit

  end

  def create

  end

  def update

  end

  def destroy

  end

  def show

  end
end
