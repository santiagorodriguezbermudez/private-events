require 'rails_helper'

RSpec.describe Event, :type => :model do
    context "with 2 or more comments" do
      it "orders them in reverse chronologically" do
        event = Event.new
        comment1 = event.create!(:name => "first comment")
        comment2 = event.create!(:date => "2020-03-02")
        comment3 = event.create!(:location => "Amsterdam")
        comment4 = event.create!(:description => "Party in Amsterdam")
        expect(event.).to eq([comment4, comment3, comment2, comment1])
      end
    end
  end