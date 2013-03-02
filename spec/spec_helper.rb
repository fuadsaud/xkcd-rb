$: << 'lib'

require 'rspec'
require 'vcr'
require 'xkcd'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end
