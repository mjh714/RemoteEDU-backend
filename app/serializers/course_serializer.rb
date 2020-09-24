class CourseSerializer < ActiveModel::Serializer
    attributes :id, :title, :length, :student_count, :student_cap
end