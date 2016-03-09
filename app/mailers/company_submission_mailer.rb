class CompanySubmissionMailer < ApplicationMailer

	def submission_notification(company)
		@company = company
		mail(to: "employment_partner@nextacademy.com", subject: "#{@company.company_name} submitted their application.")
	end

end
