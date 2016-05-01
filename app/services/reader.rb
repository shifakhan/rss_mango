class Reader
  def initialize(feeds)
    @feeds = feeds
  end

  def sorted_items
    items.sort_by{|item| item.pubdate}.reverse!
  end

  private

    def items
      items = []
      @feeds.each do |feed|
        feed_items = ParseFeed.new(feed).data.items rescue []
        items += feed_items
      end
      items
    end
end