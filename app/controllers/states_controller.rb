class StatesController < ApplicationController
      before_filter :signed_in_user
      def create
        secure_post = params.require(:state).permit(:personone, :persontwo)
        @state = State.new(secure_post) 
        if @state.save
           flash[:success] = "Please wait for confirmation!"
           redirect_to current_user
        else
           render 'basic_pages/home'
        end
      end

      def destroy
          @state = State.find(params[:id])
          @state.destroy
          redirect_to current_user
      end

      def index  
          @state = State.where(:persontwo => current_user)
      end  

     end