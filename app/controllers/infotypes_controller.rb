class InfotypesController < ApplicationController
	def show
		@infotype = Infotype.find(params[:id])
		@infos = @infotype.infos.paginate(:page => params[:page])
		@x = 0
        @y = @infos.size - 1
	end
    
    def destroy
    	@infotype = Infotype.find(params[:id])
        @infotype.destroy
        redirect_to root_url
    end

end
