require 'spec_helper'

describe Xkcd::Comic do
  before(:all) do
    VCR.insert_cassette :comics, {
      allow_playback_repeats: true,
      record: :new_episodes
    }
  end

  after(:all) { VCR.eject_cassette }

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

  context "if it's the 404 comic" do
    subject { Xkcd::Comic.new 404 }

    its(:id) { should eql 404 }
    its(:title) { should eql 'Not Found' }
  end

  context "given an invalid id" do

    it 'should raise error' do
      expect {
        Xkcd::Comic.new :not_a_valid_comic
      }.to raise_error Xkcd::Comic::InvalidComicId
    end
  end
end

