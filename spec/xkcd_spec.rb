require 'spec_helper'

describe Xkcd do
  before(:all) do
    VCR.insert_cassette :comics, {
      allow_playback_repeats: true,
      record: :new_episodes
    }
  end

  after(:all) { VCR.eject_cassette }

  it 'should have a version' do
    expect(Xkcd::VERSION).to be_an(String)
  end

  context 'given an invalid comic id' do
    it 'should be nil' do
      expect(subject[:not_a_valid_comic]).not_to be
    end
  end

  context 'given a valid comic id' do
    it 'should not be nil' do
      expect(subject[1]).to be
    end
  end
end
