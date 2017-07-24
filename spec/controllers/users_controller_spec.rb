require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#create" do
    context "with valid params" do
      let(:valid_user_params) { attributes_for(:user) }
      before { post :create, params: valid_user_params }
      it { is_expected.to respond_with(:success) }
      it "sends notice messages" do
        expect(JSON.parse(response.body)).to have_key("notice")
      end
    end

    context "with invalid params" do
      before { post :create, params: {} }
      it { is_expected.to respond_with(:unprocessable_entity) }
      it "sends error messages" do
        expect(JSON.parse(response.body)).to have_key("errors")
      end
    end
  end
end
