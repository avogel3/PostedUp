require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe "#create" do
    context "with valid user credentials" do
      before do
        user = create(:user)
        post :create, params: { email: user.email, password: user.password }
      end
      it { is_expected.to respond_with(:success) }
    end

    context "with invalid user credentials" do
      before { post :create, params: {} }
      it { is_expected.to respond_with(:unprocessable_entity) }
      it "returns error messages" do
        expect(JSON.parse(response.body)).to have_key('errors')
      end
    end
  end

end
