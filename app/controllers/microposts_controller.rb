class MicropostsController < ApplicationController
      before_filter :signed_in_user, only: [:create, :destroy]
      before_filter :correct_user,   only: :destroy
      def create
        secure_post = params.require(:micropost).permit(:content)
        micropost_tag = params[:tag]
        x = micropost_tag.size - 1
        y = 0
        a = nil
        @micropost = current_user.microposts.build(secure_post) 
        Micropost.transaction do
          if @micropost.save
            for y in 0..x do
              a = micropost_tag[y]
              tag = Tag.find(a)
              @micropost.tags << tag
            end
             flash[:success] = "Micropost created!"
             redirect_to root_url
          else
             render 'basic_pages/home'
          end
        end
      end


      def destroy
        @micropost.destroy
        redirect_to root_url
      end

      def show
        @micropost = Micropost.find_by_user_id(params[:id])
      end

       
      private

        def correct_user
          @micropost = current_user.microposts.find_by_id(params[:id])
          redirect_to root_url if @micropost.nil?
        end
    end