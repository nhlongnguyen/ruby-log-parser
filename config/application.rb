require './app/services/page_views'
require './app/services/page_unique_views'

puts PageViews.new(ARGV[0]).call
puts PageUniqueViews.new(ARGV[0]).call
