module ApplicationHelper
  include Pagy::Frontend

  def date_format date
		(date) ? date.strftime('%d-%m-%y') : ''
	end
end
