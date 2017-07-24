require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to respond_to(:email) }
  it { is_expected.to respond_to(:password_digest) }
  it "has a valid user factory" do
    user = build(:user)
    expect(user).to be_valid
  end
end
