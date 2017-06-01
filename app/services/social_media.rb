require 'koala'

class SocialMedia

  def self.post_to_wall link
    user_graph = get_access_token
    page = get_page(user_graph)
    page_token = page['access_token']
    page_id = page['id']
    @page_graph = Koala::Facebook::API.new(page_token)
    @page_graph.put_connections(page_id, 'feed', link: link)
  end

  def self.get_access_token
    user_access_token = ENV['KOALA_ACCESS_TOKEN']
    return Koala::Facebook::API.new(user_access_token)
  end

  def self.get_page user_graph
    pages = user_graph.get_connections('me', 'accounts')
    return pages.first
  end

end
