# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string
#  content     :text
#  posted_date :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string
#  user_id     :integer
#  post_status :integer
#

require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:content).of_type(:text) }
  it { is_expected.to have_db_column(:posted_date).of_type(:datetime) }
  it { is_expected.to have_db_column(:post_status).of_type(:integer).with_options(default: "draft") }
  it { is_expected.to define_enum_for(:post_status).with([ :draft, :post_later, :posted ]) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }

  it { should belong_to(:user) }

  it "should have a valid public_post factory" do
    post = build(:public_post)
    expect(post).to be_valid
    expect(post.post_status).to eq "posted"
    expect(post.posted_date).not_to be_nil
  end

  it "should have a valid scheduled_post factory" do
    post = build(:scheduled_post)
    expect(post).to be_valid
    expect(post.post_status).to eq "post_later"
    expect(post.posted_date).not_to be_nil
  end

  it "should have a valid draft factory" do
    post = build(:draft)
    expect(post).to be_valid
    expect(post.post_status).to eq "draft"
    expect(post.posted_date).to be_nil
  end

  it "adds a job to the queue if the post is a scheduled_post" do
    create(:scheduled_post)
    expect(enqueued_jobs.size).to eq 1
  end
end
