module ApplicationHelper
  def format(date)
    date.strftime('%d %B %Y')
  end
end
