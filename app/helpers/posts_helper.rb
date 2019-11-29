# frozen_string_literal: true

module PostsHelper
  def signed_in?
    !@current_user.nil?
  end
end
