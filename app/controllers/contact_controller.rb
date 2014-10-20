class ContactController < ApplicationController

  def index

    @contact_us = AdminContact.sorted_by_position_visible

    @admin_message = AdminMessage.new

  end

  def create_message

    @admin_message = AdminMessage.new(message_params)

    if @admin_message.save

      respond_to do |format|
        format.html { redirect_to :action => 'index' }
        format.js
      end


      @admin_message.send_mail
      @admin_message.send_copy

    else

      # render('contact')

    end
  end

  def message_params

    params.require(:admin_message).permit(
        :message,
        :name,
        :email

    )
  end

end
