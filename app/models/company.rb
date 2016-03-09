class Company < ActiveRecord::Base
	mount_uploader :company_logo, PictureUploader
	validates :company_profile, presence: true
	validates_format_of :hr_email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, uniqueness: true, :on => [:create]
	validates :company_name, presence: true, uniqueness: true
	validates :technology_stack, presence: true
	validates :culture, presence: true
	validates :team_info, presence: true
	store_accessor :talent_requirements

	enum status: {
	    'pending_approval' => 0,
	    'partner_company' => 1,
	    'rejected' => 2
  	}
end
