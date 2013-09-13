class NotesController < ApplicationController
  def create
    @note = Note.new(params[:note])
    if @note.save
      redirect_to track_url(params[:track_id])
    else
      flash[:notice] = "That note has already been added."
      render track_url(params[:track_id])
    end
  end

  def update
    current_note.update_attributes(params[:note])
    redirect_to track_url(params[:track_id])
  end

  def destroy

  end

  private

  def current_note
    Track.find(params[:track_id]).note
  end
end
