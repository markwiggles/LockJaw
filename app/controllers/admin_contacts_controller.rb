class AdminContactsController < ApplicationController

  layout 'admin'


  def index

    @current_page = 'Contact Us'

    @admin_contacts = AdminContact.sorted_by_position_all
  end

  # -------------------------------------------------------------------------

  # CREATE

  def new
    @admin_contact = AdminContact.new
  end

  def create
    @admin_contact = AdminContact.new(admin_contact_params)
    if @admin_contact.save
      respond_to do |format|
        format.html { redirect_to admin_contacts_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_contact = AdminContact.find params[:id]
  end

  def update
    @admin_contact = AdminContact.find params[:id]
    if @admin_contact.update_attributes(admin_contact_params)
      respond_to do |format|
        format.html { redirect_to admin_contacts_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE IMAGE

  def edit_image
    @admin_contact = AdminContact.find(params[:id])
  end

  def change_image

    @admin_contact = AdminContact.find params[:id]

    if @admin_contact.update_attributes(admin_contact_params)
      respond_to do |format|
        format.html { redirect_to admin_contacts_path }
        format.js
      end
    else
      render('edit_image')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminContact
    redirect_to admin_contacts_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminContact
    redirect_to admin_contacts_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_contacts = AdminContact.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_contacts_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_contact = AdminContact.find params[:id]
  end

  def destroy
    @admin_contact = AdminContact.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_contacts_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_contact_params
    params.require(:admin_contact).permit(
        :id,
        :heading,
        :content,
        :visible,
        :position,
        :image_url,
        :image_position,
        :image_size,
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

