require 'rails_helper'

RSpec.describe PostsController, type: :controller do

  let(:valid_attributes) {
    [attributes_for(:public_post), attributes_for(:draft)].sample
  }

  let(:invalid_attributes) {
    attributes_for(:invalid_post)
  }

  let(:valid_draft_attributes) {
    attributes_for(:draft)
  }

  let(:valid_session) { {} }

  before :each do
    @user = create(:user)
    sign_in @user
  end

  describe "GET #index" do
    before :each do
      @published = @user.posts.create(attributes_for(:public_post))
      @user.posts.create(attributes_for(:draft))
      get :index, params: {}, session: valid_session
    end

    it "assigns @posts as a list of published posts" do
      expect(assigns(:posts)).to eq([@published])
    end

    it { is_expected.to render_template("index") }
    it { is_expected.to respond_with(:success) }
  end

  describe "GET #show" do
    before :each do
      post = @user.posts.create(valid_attributes)
      get :show, params: {id: post.to_param}, session: valid_session
    end

    it "assigns @comment as a new comment" do
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it { is_expected.to respond_with(:success) }
  end

  describe "GET #new" do
    before { get :new, params: {}, session: valid_session }

    it "assigns @post as a new post" do
      expect(assigns(:post)).to be_a_new(Post)
    end

    it { is_expected.to respond_with(:success) }
  end

  describe "GET #edit" do
    before :each do
      post = @user.posts.create(valid_attributes)
      get :edit, params: {id: post.to_param}, session: valid_session
    end

    it { is_expected.to respond_with(:success) }
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {post: valid_attributes}, session: valid_session
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post :create, params: {post: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Post.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {post: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        attributes_for(:public_post)
      }

      it "updates the requested post" do
        post = @user.posts.create(valid_attributes)
        put :update, params: {id: post.to_param, post: new_attributes}, session: valid_session
        post.reload
        new_attributes.keys.each { |key| expect(post.send(key)).to eq new_attributes[key] }
      end

      it "redirects to the post" do
        post = @user.posts.create(valid_attributes)
        put :update, params: {id: post.to_param, post: valid_attributes}, session: valid_session
        expect(response).to redirect_to(post)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        post = @user.posts.create(valid_attributes)
        put :update, params: {id: post.to_param, post: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = @user.posts.create(valid_attributes)
      expect {
        delete :destroy, params: {id: post.to_param}, session: valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = @user.posts.create(valid_attributes)
      delete :destroy, params: {id: post.to_param}, session: valid_session
      expect(response).to redirect_to(posts_url)
    end
  end

  describe "GET#my_posts" do
    before :each do
      @user.posts.create(attributes_for(:public_post))
      @user.posts.create(attributes_for(:draft))
      another_user = create(:user)
      another_user.posts.create(attributes_for(:public_post))
      get :my_posts, params: {}, session: valid_session
    end

    it "assigns @posts as a list of the users posts" do
      expect(assigns(:posts)).to eq(@user.posts)
    end

    it { is_expected.to render_template("my_posts") }
    it { is_expected.to respond_with(:success)}
  end

end
