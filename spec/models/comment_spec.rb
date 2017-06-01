# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  post_id    :integer
#  user_id    :integer
#  content    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to(:post) }
  it { is_expected.to belong_to(:post) }
  it { is_expected.to validate_presence_of(:content) }
end
