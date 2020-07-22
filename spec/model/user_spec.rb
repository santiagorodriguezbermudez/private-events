require 'rails_helper'

RSpec.describe User do

  let(:subject) do
    described_class.new(
      username: 'user_example',
      email: 'user@email.com'
    )
  end

  describe 'validations' do
    it 'is valid with valid attribute' do
      expect(subject).to be_valid
    end

    it 'The username should exist' do
      subject.username = ''
      expect(subject).to_not be_valid
    end

    it 'The email should exist' do
      subject.email = ''
      expect(subject).to_not be_valid
    end

    it 'The email should have the right format' do
      subject.email = 'hello'
      expect(subject).to_not be_valid
    end

  end

  describe 'Associations' do
    it { should have_many(:created_events) }
    it { should have_many(:attended_events) }
  end
end