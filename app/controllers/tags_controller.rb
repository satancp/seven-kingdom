class TagsController < ApplicationController
      def create
          secure_params = params.require(:tag).permit(:name)
          @tag = Tag.new(secure_params)
          if @tag.save
          flash[:success] = "Tag created!"
          redirect_to root_url
        else
          render 'basic_pages/home'
        end
          end


      def destroy
        @tag.destroy
        redirect_to root_url
      end
end
