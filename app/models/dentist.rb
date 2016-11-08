class Dentist < ActiveRecord::Base
	has_many :patients
	has_many :attends
	validates :name, presence: true
	validates :name, uniqueness: true
end
