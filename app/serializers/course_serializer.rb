class CourseSerializer < ActiveModel::Serializer
    attributes :id, :title, :length, :student_count, :student_cap
    has_many :users
    has_many :meetings
end