class Album < ActiveRecord::Base
  attr_accessible :band_id, :name, :live_or_studio

  validates :band_id, :name, presence: true
  validates :live_or_studio, presence: { in: %w(live studio)}

  belongs_to :band
  has_many :tracks
end
