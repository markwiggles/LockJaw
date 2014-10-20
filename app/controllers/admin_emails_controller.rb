class AdminEmailsController < ApplicationController

  layout 'admin'


  def index
    @admin_emails = AdminEmail.sorted_by_position_all
  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_email = AdminEmail.new
  end

  def create
    @admin_email = AdminEmail.new(admin_email_params)
    if @admin_email.save
      respond_to do |format|
        format.html { redirect_to admin_emails_path }
        format.js
      end

    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_email = AdminEmail.find params[:id]
  end

  def update
    @admin_email = AdminEmail.find params[:id]
    if @admin_email.update_attributes(admin_email_params)
      respond_to do |format|
        format.html { redirect_to admin_emails_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE IMAGE

  def edit_image
    @admin_email = AdminEmail.find(params[:id])
  end

  def change_image

    @admin_email = AdminEmail.find params[:id]

    if @admin_email.update_attributes(admin_email_params)
      respond_to do |format|
        format.html { redirect_to admin_emails_path }
        format.js
      end
    else
      render('edit_image')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminEmail
    redirect_to admin_emails_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminEmail
    redirect_to admin_emails_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_emails = AdminEmail.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_emails_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_email = AdminEmail.find params[:id]
  end

  def destroy
    @admin_email = AdminEmail.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_emails_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_email_params
    params.require(:admin_email).permit(
        :id,
        :subject,
        :heading,
        :greeting,
        :body,
        :signature,
        :position,
        :visible,
        :image_id
    )
  end

  def edit_list_order(id, new_position, model)
    # get the item using the id passed
    item = model.find(id)
    # update the new position
    if item.update_attribute(:position, new_position)
    end
  end

  def edit_visibility(id, visibility, model)
    # get the item using the id passed
    item = model.find(id)
    # update the new visibility
    if item.update_attribute(:visible, visibility)
    end
  end

end

