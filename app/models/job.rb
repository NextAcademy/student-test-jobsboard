class Job < ActiveRecord::Base
	validates :title, presence: true
  	validates :job_description, presence: true
  	validates :location, presence: true
  	validates :job_poster_email, presence: true
  	validates :freelance, presence: true
  	belongs_to :company
  	store_accessor :employment_terms
end
