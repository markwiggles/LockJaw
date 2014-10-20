class AdminAboutsController < ApplicationController

  layout 'admin'


  def index
    @admin_abouts = AdminAbout.sorted_by_position_all
  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_about = AdminAbout.new
  end

  def create
    @admin_about = AdminAbout.new(admin_about_params)
    if @admin_about.save
      respond_to do |format|
        format.html { redirect_to admin_abouts_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_about = AdminAbout.find params[:id]
    logger.debug "ABOUT ID:  #{@admin_about.inspect}"
  end

  def update
    admin_about = AdminAbout.find params[:id]
    if admin_about.update_attributes(admin_about_params)
      respond_to do |format|
        format.html { redirect_to admin_abouts_path }
        format.js
      end
    else
      render('edit')
    end
  end
  # -------------------------------------------------------------------------
  # UPDATE IMAGE

  def edit_image
    @admin_about = AdminAbout.find(params[:id])
  end

  def change_image
    @admin_about = AdminAbout.find params[:id]

    if @admin_about.update_attributes(admin_about_params)
      respond_to do |format|
        format.html { redirect_to admin_abouts_path }
        format.js
      end
    else
      render('edit_image')
    end
  end
  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminAbout
    redirect_to admin_abouts_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminAbout
    redirect_to admin_abouts_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_abouts = AdminAbout.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_abouts_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_about = AdminAbout.find params[:id]
  end

  def destroy
    @admin_about = AdminAbout.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_abouts_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_about_params
    params.require(:admin_about).permit(
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

