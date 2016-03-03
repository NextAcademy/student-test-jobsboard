class Company < ActiveRecord::Base
	mount_uploader :company_logo, PictureUploader
	has_many :jobs
	validates :company_profile, presence: true
	validates :email, presence: true
	validates :company_name, presence: true, uniqueness: true
	store_accessor :talent_requirements

	enum status: {
	    'pending_approval' => 0,
	    'partner_company' => 1,
	    'rejected' => 2
  	}
end
