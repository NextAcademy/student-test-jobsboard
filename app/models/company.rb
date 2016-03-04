class Company < ActiveRecord::Base
	mount_uploader :company_logo, PictureUploader
	validates :company_profile, presence: true
	validates_format_of :hr_email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :company_name, presence: true, uniqueness: true
	store_accessor :talent_requirements	

	enum status: {
	    'pending_approval' => 0,
	    'partner_company' => 1,
	    'rejected' => 2
  	}
end
