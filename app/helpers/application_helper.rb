module ApplicationHelper
  # Returns the full title on a per-page basis.f
  def full_title(page_title = '')
    base_title = "Worknomad"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end



end
