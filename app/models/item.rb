class Item
  attr_accessor :title, :description, :pubdate, :link
  attr_reader :errors
  
  def initialize(data)
    @errors = []
    @data   = data
  end

  def parse
    @title        = sanitize_title
    @description  = sanitize_description
    @pubdate      = sanitize_pubdate
    @link         = sanitize_link
    return self
  end
  
  private
  
    def sanitize_title
      @data.xpath('title').text.html_safe
    end

    def sanitize_description
      @data.xpath('description').text.html_safe
    end

    def sanitize_pubdate
      @data.xpath('pubdate').text.to_time.to_formatted_s(:rfc822)
    end

    def sanitize_link
      link = @data.xpath('link')
      return link.text if valid_link?(link.text)
      return link.first.next.text if link.first && valid_link?(link.first.next.text)
      return '#'
    end

    def valid_link?(link)
      link.present? && (link.starts_with?('http') || link.starts_with?('www'))
    end

end