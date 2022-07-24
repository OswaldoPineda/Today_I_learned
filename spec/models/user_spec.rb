# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  subject { @user = build(:user) }

  describe 'validate fields' do
    it 'valid' do
      expect(subject).to be_valid
    end

    it 'missing email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'missing email' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end
end
