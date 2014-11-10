class CommentsController < ApplicationController
	  before_filter :signed_in_user
      before_filter :correct_user,   only: :destroy
      def create
        secure_post = params.require(:comment).permit(:content, :info_id)
        @comment = current_user.comments.build(secure_post) 
        if @comment.save
           flash[:success] = "New comment posted!"
           @info = Info.find(@comment.info_id)
           redirect_to @info
        else
           render 'basic_pages/home'
        end
    end

    def destroy
        @comment.destroy
        redirect_to root_url
    end

    def show
    	@user = current_user
        @comment = Comment.find(params[:id])
        @micropost = Micropost.where(:user_id => @comment.user.id)
    end

       
      private

        def correct_user
          @coment = current_user.comments.find_by_id(params[:id])
          redirect_to root_url if @comment.nil?
        end
end
