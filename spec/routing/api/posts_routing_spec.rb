require "rails_helper"

RSpec.describe Api::PostsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(get: "/api/posts").to route_to(controller: 'api/posts', action: 'index')
    end

    it "routes to #new" do
      expect(get: "/api/posts/new").to route_to(controller: 'api/posts', action: 'new')
    end

    it "routes to #show" do
      expect(get: "/api/posts/1").to route_to(controller: 'api/posts', action: 'show', id: "1")
    end

    it "routes to #edit" do
      expect(get: "/api/posts/1/edit").to route_to(controller: 'api/posts', action: 'edit', id: "1")
    end

    it "routes to #create" do
      expect(post: "/api/posts").to route_to(controller: 'api/posts', action: 'create')
    end

    it "routes to #update via PUT" do
      expect(put: "/api/posts/1").to route_to(controller: 'api/posts', action: 'update', id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/posts/1").to route_to(controller: "api/posts", action: 'update', id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/posts/1").to route_to(controller: "api/posts", action: "destroy", id: "1")
    end

    it "routes to #my_posts" do
      expect(get: "/api/my_posts").to route_to(controller: "api/posts", action: "my_posts")
    end

  end
end
