class UserCourseSerializer < ActiveModel::Serializer
    attributes :id, :user_id, :course_id
    has_many :user
    has_many :course
end