class Album < ActiveRecord::Base
  attr_accessible :band_id, :name

  validates :band_id, :name, presence: true
end
