
require 'rails_helper'

RSpec.describe UserEvent do

  let(:subject) do
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
  
  describe 'Associations' do
    it { should belong_to(:attendee) }
    it { should belong_to(:attended_event) }
  end

end