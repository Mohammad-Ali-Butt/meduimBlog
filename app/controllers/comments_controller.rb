class CommentsController < ApplicationController
  before_action :find_commentable


  def new
    @comment = Comment.new
  end

  def create
      #puts comment_params
      @comment = @commentable.comments.new(comment_params)
      @comment.commenter = current_user
      respond_to do |format|
        if @comment.save
          format.html { redirect_to request.referrer, notice: 'Comment was successfully created.' } # changed the redirect to @post
        end
    end
end


  def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      authorize @comment
      if @comment.destroy
        redirect_to request.referrer, notice: 'Comment was successfully deleted.', status: :see_other
      end
  end
    
    private
      def comment_params
        params.require(:comment).permit(:body,:commentable_type,:commentable_id)
      end


      def find_commentable
        if params[:comment_id]        
        @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
        elsif params[:post_id]
        @commentable = Post.find_by_id(params[:post_id]) if params[:post_id]
      end
    end
  end
  