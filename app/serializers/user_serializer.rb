class UserSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :email, :is_teacher
    has_many :courses
    has_many :user_courses
end