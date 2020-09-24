class UsersController < ApplicationController

    def index
        users = User.all
        render :json => users, each_serializer: UserSerializer
    end

    def show
        user = User.find(params[:id])
        render :json => user, each_serializer: UserSerializer
    end
    
    def create
        user = User.create(user_params)
        render :json => user, each_serializer: UserSerializer
        

        # user = User.new(user_params)
        # if user.valid?
        # user.save
        # redirect_to user_path(user)
        # else
        # flash[:my_errors] = user.errors.full_messages
        # redirect_to new_user_path
        # end
    end
    
    def update
        user = User.find(params[:id])
        user.update(user_params)
        render :json => user, each_serializer: UserSerializer
    end
    
    def delete
        user = User.find(params[:id])
        user.destroy
    
        render json: {}
    end
    
    private
    
    def user_params
        params.require(:user).permit(:full_name, :email, :password_digest, :is_teacher)
    end
    
    
end
