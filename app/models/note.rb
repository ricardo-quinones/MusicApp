class Note < ActiveRecord::Base
  attr_accessible :body, :track_id

  belongs_to :track
end
