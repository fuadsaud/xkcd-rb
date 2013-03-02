require 'addressable/uri'
require 'ostruct'

module Xkcd
  class Comic
    class InvalidComicId < Exception; end

    BASE_URI = 'http://xkcd.com'
    JSON_PATH = '/info.0.json'

    attr_reader :id, :title, :alt, :img, :url, :date

    private
    def initialize(id = nil)
      if id == 404
        @id = 404
        @title = 'Not found'
      else
        data = Comic.get(id ? "/#{id}#{JSON_PATH}" : JSON_PATH)

        @id    = data[:num]
        @title = data[:title]
        @alt   = data[:alt]
        @img   = data[:img]
        @url   = "#{BASE_URI}/#{@id}"
        @date  = Date.parse("#{data[:year]}-#{data[:month]}-#{data[:day]}")
      end
    end

    class << self
      def all
        last = Comic.new
        (1...last.id).each {|id| Comic.new(id) } << last
      end

      def get(path)
        response = HTTParty.get(BASE_URI + path)

        # 404 is not handled
        begin
          JSON.parse(response, { symbolize_names: true })
        rescue Exception
          raise InvalidComicId
        end
      end
    end
  end
end
