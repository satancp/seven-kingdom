class ChatsController < ApplicationController
	before_filter :signed_in_user
	    def create
        secure_post = params.require(:chat).permit(:friendship_id, :content,:sendperson)
        @chat = Chat.new(secure_post) 
        if @chat.save
           flash[:success] = "Send successfully!"
           redirect_to current_user
        else
           render 'basic_pages/home'
        end
      end

      def index  
      	  @friendship = Friendship.where("personone = ? or persontwo = ?", current_user, current_user)
      	  @qw = @friendship.size - 1
      	  @qp = 0
      	  @we = []
      	  for @qp in 0..@qw do 
          @we << @friendship[@qp].id
          @qp = @qp + 1
          end
          @chat = Chat.where(:friendship_id => @we)
      end  

      def destroy
      	  @chat = Chat.find(params[:id])
      	  @chat.destroy
      	  redirect_to current_user
      end
end
