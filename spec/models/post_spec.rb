require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to have_db_column(:title).of_type(:string) }
  it { is_expected.to have_db_column(:content).of_type(:text) }
  it { is_expected.to have_db_column(:posted_date).of_type(:datetime) }
  it { is_expected.to have_db_column(:published).of_type(:boolean) }
end
