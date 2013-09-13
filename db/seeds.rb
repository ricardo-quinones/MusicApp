# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Band.create(name: "The Beatles")
Album.create(name: "A Hard Day's Night", band_id: 1, live_or_studio: "studio")
Track.create(
  name: "A Hard Day's Night",
  album_id: 1,
  length_in_seconds: 153,
  track_number: 1,
  bonus: "no"
)
