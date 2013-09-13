class Track < ActiveRecord::Base
  attr_accessible :album_id, :length_in_seconds, :name, :track_number, :bonus

  validates :name, :album_id, :length_in_seconds, :bonus, presence: true

end
