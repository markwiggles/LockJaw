class ContactController < ApplicationController

  def index

    @current_page = 'Contact Us'

    @contact_us = AdminContact.sorted_by_position_visible

    @admin_message = AdminMessage.new

  end


end
