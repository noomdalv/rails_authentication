# frozen_string_literal: true

module ApplicationHelper
  def full_title(page_title = '')
    base_title = 'Ruby on Rails Members Only Project'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end


end
