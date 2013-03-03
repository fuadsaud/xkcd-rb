require 'addressable/uri'
require 'ostruct'

module Xkcd
  class Comic
    class InvalidComicId < Exception; end

    include HTTParty

    format :json
    base_uri 'http://xkcd.com'

    JSON_PATH = '/info.0.json'

    attr_reader :id, :title, :alt, :img, :url, :date

    private
    def initialize(id = nil)
      # Get the latest comic id and picks a random number in the range
      id = rand(new.id) + 1 if id == :random

      if id == 404
        @id = 404
        @title = 'Not Found'
      else
        response = Comic.get(id ? "/#{id}#{JSON_PATH}" : JSON_PATH)

        raise InvalidComicId if response.code == 404

        @id    = response['num']
        @title = response['title']
        @alt   = response['alt']
        @img   = response['img']
        @url   = "http://xkcd.com/#{@id}"
        @date  = Date.parse(
          "#{response['year']}-#{response['month']}-#{response['day']}"
        )
      end
    end

    def self.all
      last = Comic.new
      (1...last.id).each {|id| Comic.new(id) } << last
    end
  end
end
