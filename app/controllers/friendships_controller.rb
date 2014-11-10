class FriendshipsController < ApplicationController
      before_filter :signed_in_user
      def create
        secure_post = params.require(:friendship).permit(:personone, :persontwo)
        @state = State.destroy_all(:persontwo => current_user,:personone => params[:friendship][:personone])
        @friendship = Friendship.new(secure_post) 
        if @friendship.save
           flash[:success] = "Please wait for confirmation!"
           redirect_to current_user
        else
           render 'basic_pages/home'
        end
      end

      def destroy
          @friendship.destroy
          redirect_to current_user
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
    end