class TracksController < ApplicationController
  def index
    @album = Album.find(params[:album_id])
    @band = @album.band
    @album_tracks = @album.tracks
  end

  def show
    current_track
    current_album
    current_band
    @note = (current_track.note.nil? ? Note.new : current_track.note)
  end

  def new
    @album = Album.find(params[:album_id])
    @band_albums = @album.band.albums
    @track = Track.new
  end

  def edit
    current_track
    current_album
    @band_albums = current_band.albums
  end

  def create
    @track = Track.new(params[:track])
    @album = @track.album
    @band_albums = @album.band.albums
    if @track.save
      redirect_to album_url(@track)
    else
      flash[:notice] = "That track has already been added."
      render :new
    end
  end

  def update
    current_track.update_attributes(params[:track])
    redirect_to track_url(current_track)
  end

  def destroy
    album = Track.find(params[:id]).album
    Track.delete(params[:id])

    redirect_to album_url(album)
  end

  private

  def current_track
    @track = Track.find(params[:id])
  end

  def current_album
    @album = current_track.album
  end

  def current_band
    @band = current_album.band
  end
end
