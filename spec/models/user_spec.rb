# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string
#  last_name              :string
#  preferred_timezone     :string
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_db_column(:email).of_type(:string) }
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }
  it { should have_db_column(:preferred_timezone).of_type(:string) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:preferred_timezone) }

  it { should have_many(:posts) }
  
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
