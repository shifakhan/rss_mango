require 'open-uri'

class ParseFeed
  def initialize(feed)
    @errors = []
    @url    = feed.url
    @doc    = open_url
    @title  = nil
    @items  = nil
  end

  attr_reader :title, :items, :errors

  def data
    @title  = @doc.xpath('//channel/title').text
    @items  = parse_items
  rescue
    @errors << 'Sorry, could not read RSS file!' unless @title && @items
  ensure
    return self
  end

  private

    def open_url
      response = open(@url)
      Nokogiri::HTML(response)
    rescue
      @errors << 'Please check if RSS URL is valid!' unless response
    end

    def parse_items
      [].tap do |items|
        @doc.xpath('//channel/item').each do |data|
          item = Item.new(data).parse
          items << item
        end
      end
    end
end