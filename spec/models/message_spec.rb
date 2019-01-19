require 'rails_helper'

describe Message, type: :model do
  subject { create(:message) }

  describe 'included fields' do
    it { is_expected.to respond_to(:text) }
    it { is_expected.to respond_to(:title) }
  end

  describe 'Relations' do
    it { is_expected.to belong_to(:user) }
  end
  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
