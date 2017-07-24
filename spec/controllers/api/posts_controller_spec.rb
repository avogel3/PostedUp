require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do
  describe "#index" do
    before { get :index }
    it { is_expected.to respond_with(:success) }
  end
end
