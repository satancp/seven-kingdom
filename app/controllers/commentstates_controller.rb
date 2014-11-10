class CommentstatesController < ApplicationController
	  before_filter :signed_in_user
      def create
        secure_post = params.require(:commentstate).permit(:state, :info_id)
        @commentstate = current_user.commentstates.build(secure_post) 
        if @commentstate.save
           flash[:success] = "Submit successfully!"
           @info = Info.find(@commentstate.info_id)
           redirect_to @info
        else
           render 'basic_pages/home'
        end
    end

       
      private

        def correct_user
          @comentstate = current_user.commentstates.find_by_id(params[:id])
          redirect_to root_url if @commentstate.nil?
        end
end
