require 'pry'

class UsersController < ApplicationController
    skip_before_action :authorized, only: [:index, :create]

    def index
        users = User.all
        render :json => users, each_serializer: UserSerializer
    end

    def show
        user = User.find(params[:id])
        render :json => user, each_serializer: UserSerializer
    end
    
    def create
        @user = User.create(user_params)
        # binding.pry
        if @user.valid?
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
            # render :json => @user, each_serializer: UserSerializer, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end
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
        params.permit(:full_name, :email, :password, :is_teacher)
    end
end
