class AdminMessagesController < ApplicationController


# -------------------------------------------------------------------------
# CREATE

  def new
    @admin_message = AdminMessage.new
  end

  def create
    @admin_message = AdminMessage.new(message_params)
    if @admin_message.save
      respond_to do |format|
        format.html { redirect_to contact_path }
        format.js
      end

      @admin_message.send_mail
      @admin_message.send_copy

    else
      render('new')
    end
  end

# -------------------------------------------------------------------------

  def message_params

    params.require(:admin_message).permit(
        :message,
        :name,
        :email
    )
  end


end