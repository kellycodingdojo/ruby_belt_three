class IdeasController < ApplicationController

	def bright_ideas
		@user = current_user
		@idea = Idea.all
	end

	
	def create
    @user = current_user
    @idea = Idea.new idea_params
    if @idea.save
      redirect_to "/bright_ideas"
    else
      flash[:errors] = @idea.errors.full_messages
       redirect_to :back
    end
  end

	def show
  	@idea = Idea.includes(:user)
  	redirect_to '/idea_page/#{@idea.id}'
  end

 # def destroy
 #    @user = current_user
 #    @idea = Idea.find(params[:id])
 #    if @idea.user === current_user
 #      @idea.destroy
 #      redirect_to "/bright_ideas"
 #    else
 #      flash[:errors] = @idea.errors.full_messages
 #      redirect_to :back
 #    end
 #  end

private
    def idea_params
      params.require(:idea).permit(:content).merge(user: current_user)
    end
end