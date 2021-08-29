class UserCommentsController < ApplicationController
	def create
	    @advertisement = Advertisement.find(params[:advertisement_id])
	    @user_comment = @advertisement.user_comments.create(user_comment_params)
	    if @user_comment.save
	    	redirect_to @advertisement, notice:"Comment Added Successfully"
	    else
	        redirect_to @advertisement, notice:"Please enter all the fields."
	    end
	     
	  end

	  private
	    def user_comment_params
	      params.require(:user_comment).permit(:commenter, :body)
	    end
end
