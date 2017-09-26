require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:email).of_type(:string) }
  it { is_expected.to have_db_column(:first_name).of_type(:string) }
  it { is_expected.to have_db_column(:last_name).of_type(:string) }
  it { is_expected.to have_db_column(:preferred_timezone).of_type(:string) }

  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }
  it { is_expected.to validate_presence_of(:preferred_timezone) }

  it { is_expected.to have_many(:posts) }

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "has an invalid factory" do
    expect(build(:invalid_user)).not_to be_valid
  end

  it "displays the user's full name" do
    user = build(:user)
    expect(user.display_name).to eq "#{user.first_name} #{user.last_name}"
  end

end
