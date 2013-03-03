require "xkcd/version"

require "httparty"
require "json"

module Xkcd
  require "xkcd/comic"

  class << self
    #
    # Fetch a comic from the xkcd API.
    #
    # Parameters:
    # - id: the comic number or :random. Assumes the latest comic if not given
    #
    def [](id)
      Xkcd::Comic.new(id)
    rescue Xkcd::Comic::InvalidComicId
      nil
    end

    #
    # Shortcut for #[]
    #
    def latest
      self[]
    end

    #
    # Shortcut for #[:random]
    #
    def random
      self[:random]
    end
  end
end
