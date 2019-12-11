<<<<<<< HEAD
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
=======
# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
>>>>>>> 3b60921297d8ea6da4c14cf13dab4cdea8beef85
end
