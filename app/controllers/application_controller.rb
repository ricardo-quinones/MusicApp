class ApplicationController < ActionController::Base
  include ApplicationHelper

  before_filter :require_user_is_logged_in!

  protect_from_forgery
end
