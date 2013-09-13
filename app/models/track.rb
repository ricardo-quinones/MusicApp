class Track < ActiveRecord::Base
  attr_accessible :album_id, :name, :track_number, :bonus, :lyrics, :length

  validates :name, :album_id, :length_in_seconds, presence: true
  validates :bonus, presence: { in: %w(yes no)}
  validates :name, uniqueness: true

  belongs_to :album
  has_many :notes

  def length=(length)
    @length = length
    time_array = @length.split(":").map(&:to_i)
    self.length_in_seconds = time_array.first * 60 + time_array.last
  end

  def formatted_length
    seconds = self.length_in_seconds
    "#{seconds / 60}:#{seconds % 60}"
  end
end
