require 'rails_helper'

RSpec.describe UserEvent do
  let(:test_user) { User.create(username: 'Example User', email: 'test@gmail.com') }
  let(:test_event) do
    Event.create(
      name: 'Example User',
      location: 'test',
      date: '2020-08-04',
      description: 'test',
      creator_id: test_user.id
    )
  end

  let(:subject) do
    test_user
    test_event
    described_class.new(
      attendee_id: 1,
      attended_event_id: 1
    )
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without attendee_id' do
      subject.attendee_id = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid without attended_event_id' do
      subject.attended_event_id = ''
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations', type: :model do
    it { should belong_to(:attendee) }
    it { should belong_to(:attended_event) }
  end
end
