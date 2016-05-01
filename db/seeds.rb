# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
feeds = [
  { url: 'http://news.yahoo.com/rss/' },
  { url: 'http://rss.cnn.com/rss/cnn_topstories.rss' },
  { url: 'http://feeds.feedburner.com/Makeuseof' },
  { url: 'http://feeds.sciencedaily.com/sciencedaily' },
  { url: 'http://timesofindia.indiatimes.com/rssfeedstopstories.cms' }
]
feeds.each do |feed_params|
  Feed.create(feed_params)
end
