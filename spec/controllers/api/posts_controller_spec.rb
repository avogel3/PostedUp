require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do
  describe "#index" do
    before { get :index }
    it { is_expected.to respond_with(:success) }
  end

  describe "show" do
    before do
      post = create(:post)
      get :show, params: { id: post.to_param }
    end
    it { is_expected.to respond_with(:success) }
  end
end
