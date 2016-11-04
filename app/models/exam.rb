class Exam < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :price, presence: true
end
