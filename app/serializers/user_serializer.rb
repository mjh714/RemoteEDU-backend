class UserSerializer < ActiveModel::Serializer
    attributes :id, :full_name, :email, :is_teacher
end