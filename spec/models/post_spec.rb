# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  posted_date :datetime
#  published   :boolean          default("false")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  # Database design 
  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:content).of_type(:text) }
  it { is_expected.to have_db_column(:posted_date).of_type(:datetime) }
  it { is_expected.to have_db_column(:published)
        .of_type(:boolean).with_options(default: false) }
  
  # Validations
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  # Factories
  it "should have a valid public_post factory" do
    post = build(:public_post)
    expect(post).to be_valid
    expect(post.published).to eq true
    expect(post.posted_date).not_to be_nil
  end
  
  it "should have a valid draft factory" do
    post = build(:draft)
    expect(post).to be_valid
    expect(post.published).to eq false
    expect(post.posted_date).to be_nil
  end

  
end
