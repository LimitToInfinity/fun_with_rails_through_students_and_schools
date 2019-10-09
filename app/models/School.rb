class School < ApplicationRecord
    has_many :students
    validates :name, presence: true, uniqueness: { message: "already exists yo!" }
end