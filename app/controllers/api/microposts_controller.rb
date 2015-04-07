class Api::MicropostsController < Api::BaseController

  def index
    @microposts = Micropost.all
    raise Ranking::Error::API::Campaign::CommentFailed.new
  end
end