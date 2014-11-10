class CommentstatemsController < ApplicationController
	  before_filter :signed_in_user
      def create
        secure_post = params.require(:commentstatem).permit(:state, :micropost_id)
        @commentstatem = current_user.commentstatems.build(secure_post) 
        @micropost = Micropost.find(@commentstatem.micropost_id)
        @user = @micropost.user
        if @commentstatem.save
           flash[:success] = "Submit successfully!"
           redirect_to @user
        else
           redirect_to @user
        end
    end

       
      private

        def correct_user
          @comentstatem = current_user.commentstatems.find_by_id(params[:id])
          redirect_to root_url if @commentstatem.nil?
        end
end
