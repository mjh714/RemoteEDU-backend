class User < ApplicationRecord
    has_many :user_courses
    has_many :courses, through: :user_courses   
    has_secure_password
    validates :email, uniqueness: true
end