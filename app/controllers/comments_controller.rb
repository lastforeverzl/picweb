class CommentsController < ApplicationController


	def create
		@project = Project.find(params[:project_id])
		@comment = current_user.comments.build(params[:comment])
	    @comment.project_id = @project.id
	    # @comment.user = current_user

	    if @comment.save
	    	flash[:notice] = "Comment saved!"
	      	redirect_to @project
	    else
	    	flash[:notice] = "Could not save comment!"
	      	redirect_to @project
	    end
	end
end
