require 'rails_helper'

describe Account, type: :model do
  subject { create(:account) }

  describe 'included fields' do
    it { is_expected.to respond_to(:balance) }
    it { is_expected.to respond_to(:currency) }
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
