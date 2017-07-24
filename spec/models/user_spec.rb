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
  it "updates the auth token on save." do
    user = build(:user)
    expect(user.auth_token).to be_nil
    user.save
    expect(user.auth_token).not_to be_nil
  end
  it { is_expected.to validate_uniqueness_of(:auth_token) }
  it { is_expected.to have_many(:posts) }
end
