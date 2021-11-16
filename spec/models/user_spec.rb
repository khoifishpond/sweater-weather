require 'rails_helper'

describe User do
  describe 'relationships' do
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
    it { should have_secure_password }
  end
end
