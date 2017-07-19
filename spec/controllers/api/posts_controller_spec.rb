require 'rails_helper'

RSpec.describe Api::PostsController, type: :controller do

  let(:valid_attributes) { [attributes_for(:public_post), attributes_for(:draft)].sample }
  let(:invalid_attributes) { attributes_for(:invalid_post) }
  let(:valid_draft_attributes) { attributes_for(:draft) }

  before :each do
    @user = create(:user)
    sign_in @user
  end

  describe "GET #index" do
    before :each do
      @published = @user.posts.create(attributes_for(:public_post))
      @user.posts.create(attributes_for(:draft))
      get :index, params: {}
    end


    it "assigns @posts as a list of published posts" do
      expect(assigns(:posts)).to eq([@published])
    end

    it { is_expected.to respond_with(:success) }
  end

  describe "GET #show" do
    let(:post) { @user.posts.create(valid_attributes) }
    before { get :show, params: { id: post.to_param } }
    it { is_expected.to respond_with(:success) }
  end

  describe "GET #edit" do
    let(:post) { @user.posts.create(valid_attributes) }
    before { get :edit, params: { id: post.to_param } }
    it { is_expected.to respond_with(:success) }
  end

  describe "POST #create" do
    context "with valid params" do
      before { post :create, params: {post: valid_attributes} }
      it { is_expected.to respond_with(:success) }
    end

    context "with invalid params" do
      before { post :create, params: { post: invalid_attributes } }
      it { is_expected.to respond_with(:unprocessable_entity) }

      it "returns the errors in a hash" do
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end

  describe "PUT #update" do
    let(:post) { @user.posts.create(valid_attributes) }

    context "with valid params" do
      let(:new_attributes) { attributes_for(:updated_post_content) }
      before { put :update, params: { id: post.to_param, post: new_attributes } }

      it "updates the requested post" do
        post.reload
        new_attributes.keys.each { |key| expect(post.send(key)).to eq new_attributes[key] }
      end

      it { is_expected.to respond_with(:success) }
    end

    context "with invalid params" do
      before { put :update, params: { id: post.to_param, post: invalid_attributes } }
      it { is_expected.to respond_with(:unprocessable_entity) }

      it "returns the errors in a hash" do
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end

  describe "DELETE #destroy" do
    let(:post) { @user.posts.create(valid_attributes) }
    before { delete :destroy, params: { id: post.to_param } }
    it { is_expected.to respond_with(:success) }
  end

  describe "GET#my_posts" do
    before :each do
      @user.posts.create(attributes_for(:public_post))
      @user.posts.create(attributes_for(:draft))
      another_user = create(:user)
      another_user.posts.create(attributes_for(:public_post))
      get :my_posts, params: {}
    end

    it "assigns @posts as a list of the users posts" do
      expect(assigns(:posts)).to eq(@user.posts.order("updated_at DESC"))
    end

    it { is_expected.to respond_with(:success)}
  end

end
