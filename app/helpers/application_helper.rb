module ApplicationHelper
	def full_title(page_title)
	  base_title = "Next Academy Employment Portal"
	  page_title.empty? ?  base_title : "#{base_title} | #{page_title}"
	end
end
