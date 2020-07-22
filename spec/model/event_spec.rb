require 'rails_helper'

RSpec.describe Event do
  let(:test_user) { User.create(username: 'Example User', email: 'test@example.com') }
  let(:subject) do
    described_class.new(
      name: 'new job offer',
      location: 'Example location',
      date: '2020-08-10',
      creator_id: test_user.id,
      description: 'Hello this is a test description'
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a date' do
      subject.date = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a creator_id' do
      subject.creator_id = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:creator) }
    it { should have_many(:attendees) }
  end
end