class InfosController < ApplicationController
	def index  

        
        @info = Info.search(params[:search])
    end  

    def create
        secure_post = params.require(:info).permit(:content, :title, :infotype_id)
        @info = current_user.infos.build(secure_post) 
        if @info.save
           flash[:success] = "New info created!"
           redirect_to root_url
        else
           render 'basic_pages/home'
        end
    end

    def destroy
    	@info = Info.find(params[:id])
        @info.destroy
        redirect_to root_url
    end

    def show
    	@user = current_user
        @info = Info.find(params[:id])
        @comments = @info.comments.paginate(:page => params[:page])
        @commentstates = @info.commentstates
    end
end
