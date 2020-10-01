require 'pry'

class UserCoursesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :destroy]

    def index
        user_courses = UserCourse.all
        render :json => user_courses, each_serializer: UserCourseSerializer
    end
    
    def show
        user_course = UserCourse.find(params[:id])
        render :json => user_course, each_serializer: UserCourseSerializer
    end
    
    def create
        user_course = UserCourse.create(user_course_params)
        render :json => user_course, each_serializer: UserCourseSerializer
        # @user_course = UserCourse.new(user_course_params)
        # if @user_course.valid?
        # @user_course.save
        # redirect_to user_course_path(@user_course)
        # else
        # flash[:my_errors] = @user_course.errors.full_messages
        # redirect_to new_user_course_path
        # end
    end
    
    def update
        user_course = UserCourse.find(params[:id])
        user_course.update(user_course_params)
        render :json => user_course, each_serializer: UserCourseSerializer
    end
    
    def destroy
        # binding.pry
        user_course = UserCourse.find(params[:id])
        user_course.destroy
        render json: {}
    end
    
    private
    
    def user_course_params
        params.require(:user_course).permit(:user_id, :course_id)
    end
    
    
end
