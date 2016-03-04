class Job < ActiveRecord::Base
	validates :title, presence: true
  	validates :job_description, presence: true
  	validates :location, presence: true
  	validates :employment_terms, presence: true
  	store_accessor :employment_terms
  	validates_format_of :job_poster_email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
