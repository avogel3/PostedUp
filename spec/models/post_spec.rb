require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:content).of_type(:text) }
  it { is_expected.to have_db_column(:posted_at).of_type(:datetime) }
  it { is_expected.to have_db_column(:post_status).of_type(:integer).with_options(default: 'draft') }
  it { is_expected.to define_enum_for(:post_status).with(%i[draft post_later posted]) }

  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:content) }

  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:comments) }

  it 'should have a valid public_post factory' do
    post = build(:public_post)
    expect(post).to be_valid
    expect(post.post_status).to eq 'posted'
    expect(post.posted_at).not_to be_nil
  end

  it 'should have a valid scheduled_post factory' do
    post = build(:scheduled_post)
    expect(post).to be_valid
    expect(post.post_status).to eq 'post_later'
    expect(post.posted_at).not_to be_nil
  end

  it 'should have a valid draft factory' do
    post = build(:draft)
    expect(post).to be_valid
    expect(post.post_status).to eq 'draft'
    expect(post.posted_at).to be_nil
  end

  it 'adds a job to the queue if the post is a scheduled_post' do
    create(:scheduled_post)
    expect(enqueued_jobs.size).to eq 1
  end

  it 'renders the image url for JBuilder Views' do
    post = create(:public_post)
    expect(post.image_url).to eq post.image.url
  end

  it 'has a valid updated_post_content factory' do
    expect(build(:updated_post_content)).to be_valid
  end
end
