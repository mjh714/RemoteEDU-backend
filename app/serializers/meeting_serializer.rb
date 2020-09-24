class MeetingSerializer < ActiveModel::Serializer
    attributes :id, :date, :time, :link, :course_id
end