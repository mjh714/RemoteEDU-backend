class MeetingsController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :show]

    def index
        meetings = Meeting.all
        render :json => meetings, each_serializer: MeetingSerializer
    end
    
    def show
        meeting = Meeting.find(params[:id])
        render :json => meeting, each_serializer: MeetingSerializer
    end
    
    def create
        meeting = Meeting.create(meeting_params)
        render :json => meeting, each_serializer: MeetingSerializer

        # meeting = Meeting.new(meeting_params)
        # if meeting.valid?
        # meeting.save
        # redirect_to meeting_path(meeting)
        # else
        # flash[:my_errors] = meeting.errors.full_messages
        # redirect_to new_meeting_path
        # end
    end
    
    def update
        meeting = Meeting.find(params[:id])
        meeting.update(meeting_params)
        render :json => meeting, each_serializer: MeetingSerializer
    end
    
    def delete
        meeting = Meeting.find(params[:id])
        meeting.destroy
    
        render json: {}
    end
    
    def meeting_params
        params.require(:meeting).permit(:date, :time, :link, :course_id)
    end
end
