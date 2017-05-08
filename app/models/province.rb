class Province < ActiveRecord::Base
	has_many :clinics
	validates :name, presence: true, uniqueness: true
	validates :acronym, presence: true, uniqueness: true

	#substituido pelo default_scope
	#scope :alphabetically, -> { order("name ASC") }

	default_scope -> { order("name ASC") }
end
