class UsersController < ApplicationController
	    def index  
        
      end   

    def destroy
        @user = User.find(params[:id])
        Friendship.destroy_all(:personone => current_user.id,:persontwo => @user.id)
        Friendship.destroy_all(:personone => @user.id,:persontwo => current_user.id)
        redirect_to current_user
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(:page => params[:page])
    end

    def create
        secure_params = params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation, :age, :gender, :power,:love)
        @user = User.new(secure_params)
        if @user.save
           sign_in @user      
           flash[:success] = "Welcome to PlayMore!" 
           redirect_to @user 
        else
           render 'new'
        end
    end


    def update
        @user = User.find(params[:id])
        if @user.update(x)
           flash[:success] = "Profile updated"
           sign_in @user
           redirect_to @user  
        else
           render 'edit' 
        end
    end
    
    def edit
	    @user = User.find(params[:id])
    end

    private
    def correct_user
        @user = User.find(params[:id])
        redirect_to(root_path) unless current_user? (@user)
    end

    def x
      params.require(:user).permit(:name, :email, 
                                  :password, :password_confirmation, :age, :gender, :power,:love,:avatar,:file_avatar)
    end

end
