class CommentsController < ApplicationController
    def new
    end
  
    def create
      comment = Comment.create(comment_params)
      render json: {
        comment: comment.comment,
        ename: comment.employee.ename,
      }
    end
  
    private 
  
    def comment_params
      params.require(:comment).permit(:comment, :food_id, :employee_id)
    end
end
