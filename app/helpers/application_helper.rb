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

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user ||= User.find_by(id: cookies.signed[:user_id])
  end

  def signed_in?
    !current_user.nil?
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(User.remember_digest).is_password?(remember_token)
  end

  def remember(user)
    session[:user_id] = user.id
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_digest
  end

  # Signs out the current user.
  def sign_out
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
    session.delete(:user_id)
    @current_user = nil
  end
end
