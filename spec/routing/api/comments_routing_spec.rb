require 'rails_helper'

RSpec.describe Api::CommentsController, type: :routing do
  describe "routing" do
    it "routes to #create" do
      expect(:post => "/api/posts/1/comments").to route_to(controller: "api/comments", action: "create", post_id: "1")
    end
  end
end
