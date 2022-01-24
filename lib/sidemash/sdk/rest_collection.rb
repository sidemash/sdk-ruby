

module Sidemash::SDK
  class StreamSquareRestCollection
    attr_reader :url
    attr_reader :pagination
    attr_reader :items

    def initialize(url, pagination, items)
      @_type = 'StreamSquareRestCollection'
      @url = url
      @pagination = pagination
      @items = items
    end

    def self._type
      'StreamSquareRestCollection'
    end

    def self.from_json(js)
      h = JSON.parse(js)
      StreamSquareRestCollection.from_hash(h)
    end

    def to_remote
      result = {}
      result[:_type] = @_type
      result[:url] = @url
      result[:pagination] = @pagination.to_remote
      result[:items] = @items.map { |el| el.to_remote }
      result
    end

    def to_hash
      result = {}
      result[:_type] = @_type
      result[:url] = @url
      result[:pagination] = @pagination.to_hash
      result[:items] = @items.map { |el| el.to_hash }
      result
    end

    def self.from_remote(h)
      StreamSquareRestCollection.new(h['url'],
                                     Pagination.from_remote(h['pagination']),
                                     h['items'].map { |item_hash| StreamSquare.from_remote(item_hash) })
    end

    def self.from_hash(h)
      StreamSquareRestCollection.new(h['url'],
                                     Pagination.from_hash(h['pagination']),
                                     h['items'].map { |item_hash| StreamSquare.from_hash(item_hash) })
    end

    def to_json(*a)
      to_hash.to_json(*a)
    end

    def to_s
      ('StreamSquareRestCollection(url=' + @url +
                                  ', pagination=' + @pagination.to_s +
                                  ', items=' + @items.to_s + ')')
    end
  end
end
