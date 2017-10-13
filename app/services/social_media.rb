require 'koala'

class SocialMedia
  def call(link)
    new(link).post_to_facebook
  end

  def initialize(link)
    @link = link
    @user_graph = authenticate_with_access_token
    @page_credentials = get_page
  end

  attr_reader :link, :user_graph, :page_credentials

  private

  def post_to_facebook
    Koala::Facebook::API.new(page_credentials['access_token']).put_connections(page_credentials['id'], 'feed', link: link)
  end

  def authenticate_with_access_token
    user_access_token = ENV.fetch('KOALA_ACCESS_TOKEN')
    Koala::Facebook::API.new(user_access_token)
  end

  def get_page
    user_graph.get_connections('me', 'accounts').first
  end
end
