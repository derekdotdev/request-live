class Request < ApplicationRecord
	belongs_to :user
	
	validate :one_field_present
	validates :artist, length: { minimum: 2 }, allow_blank: true
	validates :title, length: { minimum: 2 }, allow_blank: true
	validates :comments, length: { minimum: 2 }, allow_blank: true

	def created_at_in_time_zone
		created_at.in_time_zone('America/New_York')
	end
	private

	def one_field_present
	  if %w(artist title comments).all? { |attr| self[attr].blank? }
	    errors.add :base, 'Please fill in at least one field'
	    throw :abort
	  end
	end
end