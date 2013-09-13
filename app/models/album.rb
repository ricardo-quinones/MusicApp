class Album < ActiveRecord::Base
  attr_accessible :band_id, :name, :live_or_studio

  validates :band_id, :name, :live_or_studio presence: true
end
