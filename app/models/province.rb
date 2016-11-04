class Province < ActiveRecord::Base
	has_many :clinics
	has_many :patients
	validates :name, presence: true, uniqueness: true
	validates :acronym, presence: true, uniqueness: true


	scope :alphabetically, -> { order("name ASC") }
end
