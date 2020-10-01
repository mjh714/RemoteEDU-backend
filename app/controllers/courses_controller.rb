class CoursesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]
    def index
        courses = Course.all
        render :json => courses, each_serializer: CourseSerializer
    end
    
    def show
        course = Course.find(params[:id])
        render :json => course, each_serializer: CourseSerializer
    end
    
    def create
        course = Course.create(course_params)
        render :json => course, each_serializer: CourseSerializer
        # @course = Course.new(course_params)
        # if @course.valid?
        # @course.save
        # redirect_to course_path(@course)
        # else
        # flash[:my_errors] = @course.errors.full_messages
        # redirect_to new_course_path
        # end
    end
    
    def update
        course = Course.find(params[:id])
        course.update(course_params)
        render :json => course, each_serializer: CourseSerializer
    end
    
    def delete
        course = Course.find(params[:id])
        course.destroy
        render json: {}
    end
    
    private
    
    def course_params
        params.require(:course).permit(:title, :length, :student_count, :student_cap)
    end
    
    
end
