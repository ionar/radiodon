class Requester < ActiveRecord::Base
	has_many :attends
	validates :name, presence: true
	validates :name, uniqueness: true

	default_scope { order(name: :asc) }

end
