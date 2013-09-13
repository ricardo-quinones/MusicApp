class Track < ActiveRecord::Base
  attr_accessible :album_id, :length_in_seconds, :name, :track_number, :bonus

  validates :name, :album_id, :length_in_seconds, presence: true
  validates :bonus, presence: { in: %w(yes no)}

  belongs_to :album

  def length
    seconds = self.length_in_seconds
    "#{seconds / 60}:#{seconds % 60}"
  end
end
