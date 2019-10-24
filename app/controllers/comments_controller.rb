class CommentsController < ApplicationController

	def new
		@comment = Comment.new(story_id: params[:story_id] )
	end

	def create
		run Comment::Create, comment_params do |result|
    	return redirect_to comments_path
  	end
  	redirect_to comments_path
  end

  def index
    res = run Comment::Index
    @comments = res["model"]
  end

  def comment_params
    params.require(:comment).permit(:content, :story_id)
  end

end
