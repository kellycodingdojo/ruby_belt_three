class LikesController < ApplicationController


  def create
    @like = Like.create like_params
    redirect_to '/bright_ideas'
  end


	def idea_page
	@user = current_user
    @like = Like.create like_params
    redirect_to '/idea_page/#{@idea.id}'
  end

  private
    def like_params
      params.require(:like).permit(:idea_id).merge(user: current_user)
    end

end
