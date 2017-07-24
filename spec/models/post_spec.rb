require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to respond_to(:title) }
  it { is_expected.to respond_to(:content) }
  it { is_expected.to respond_to(:posted_date) }
  it { is_expected.to respond_to(:image) }
  it { is_expected.to belong_to(:user) }
end
