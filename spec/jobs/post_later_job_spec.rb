require 'rails_helper'

RSpec.describe PostLaterJob, type: :job do
  
  before :each do
    user = create(:user)
    @post = user.posts.create(attributes_for(:draft))
  end

  describe "#perform" do
    it "updates the post staus" do
      PostLaterJob.new.perform(@post.id)
      @post.reload
      expect(@post.posted?).to eq true
    end
  end

  describe "#perform_later" do
    it "adds the job to the :default queue" do
      job = PostLaterJob.perform_later(@post.id)
      expect(enqueued_jobs.last[:queue]).to eq job.queue_name
      expect(enqueued_jobs.last[:job]).to eq job.class
    end
  end
end
