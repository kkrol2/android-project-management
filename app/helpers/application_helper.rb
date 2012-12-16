module ApplicationHelper

	def img(url,width,height)
		if(url == nil)
			return ""
		end
		return "<img src='/uploads/"+url+"' alt='brak obrazka' width='"+width.to_s+"' height='"+height.to_s+"'/>"
	end

end
