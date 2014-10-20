class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout 'default'

  before_filter 'assign_names'

  def assign_names

    @website_name = 'Ladderclampz'

  end




end
