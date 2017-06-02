require 'rails_helper'

RSpec.describe PostToSocialJob, type: :job do
  include Rails.application.routes.url_helpers

  before :each do
    user = create(:user)
    @post = user.posts.create(attributes_for(:draft))
    @link_url = post_url(self, host: Rails.application.secrets.host_url)
  end

  describe "#perform_later" do
    it "adds the job to the :default queue" do
      job = PostToSocialJob.perform_later(@link_url)
      expect(enqueued_jobs.last[:queue]).to eq job.queue_name
      expect(enqueued_jobs.last[:job]).to eq job.class
    end
  end
end
