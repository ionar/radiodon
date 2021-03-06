class Exam < ActiveRecord::Base
	has_and_belongs_to_many :attends
	validates :name, presence: true
	validates :name, uniqueness: true

	
	default_scope { order(name: :asc) }

end
