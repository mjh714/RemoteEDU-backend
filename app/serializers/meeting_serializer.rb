class MeetingSerializer < ActiveModel::Serializer
    attributes :id, :date, :time, :link, :course_id
    has_one :course
end