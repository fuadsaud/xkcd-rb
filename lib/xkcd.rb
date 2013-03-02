require "xkcd/version"

require "httparty"
require "json"

module Xkcd
  require "xkcd/comic"

  def latest
    Xkcd::Comic.latest
  end

  def self.[](id)
    Xkcd::Comic.new(id)
  rescue Xkcd::Comic::InvalidComicId
    nil
  end
end
