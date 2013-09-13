module BandsHelper

  def live(album)
    album.live_or_studio == "live" ? "(live)" : ""
  end
end
