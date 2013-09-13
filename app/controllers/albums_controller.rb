class AlbumsController < ApplicationController
  def index
    @band = Band.find(current_band)
    @band_albums = @band.albums
  end

  def show
    @album = current_album
    @band = @album.band
  end

  def new
    @band = current_band
    @album = Album.new
  end

  def edit
    @album = current_album
    @band = @album.band
  end

  def create
    @album = Album.new(params[:album])
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:notice] = "That album has already been added."
      render :new
    end
  end

  def update
    current_album.update_attributes(params[:album])
    redirect_to album_url(current_album)
  end

  def destroy
    band = Album.find(params[:id]).band
    Album.delete(params[:id])

    redirect_to band_albums_url(band)
  end

  private

  def current_album
    @album = Album.find(params[:id])
  end

  def current_band
    @band = Band.find(params[:band_id])
  end
end
