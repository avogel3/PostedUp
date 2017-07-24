require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password_digest) }
  it "has a valid user factory" do
    user = build(:user)
    expect(user).to be_valid
  end
  it { is_expected.to respond_to(:auth_token) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:email) }
end
