require 'spec_helper'

describe Xkcd::Comic do
  before(:all) do
    VCR.insert_cassette :comics, {
      allow_playback_repeats: true,
      record: :new_episodes
    }
  end

  after(:all)  { VCR.eject_cassette }

  subject { Xkcd::Comic.new }

  it { should_not be_nil }

  its(:id) {
    should_not be_nil
    should be_an(Integer)
  }

  its(:title) {
    should_not be_nil
    should be_a(String)
  }

  its(:alt) {
    should_not be_nil
    should be_a(String)
  }

  its(:img) {
    should_not be_nil
    should be_a(String)
    pending 'Find adequate matcher' # should be_a valid_uri
  }

  its(:url) {
    should_not be_nil
    should be_a(String)
    pending 'Find adequate matcher' # should be_a valid_uri
  }

  its(:date) { should_not be_nil }
end

