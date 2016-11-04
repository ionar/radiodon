class Dentist < ActiveRecord::Base
	has_many :patients
	validates :name, presence: true
	validates :name, uniqueness: true
end
