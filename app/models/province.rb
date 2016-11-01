class Province < ActiveRecord::Base
	has_many :clinics
	validates :name, presence: true, uniqueness: true
	validates :acronym, presence: true, uniqueness: true


	scope :alphabetically, -> { order("name ASC") }
end
