class AdminHowsController < ApplicationController

  layout 'admin'


  def index
    @admin_hows = AdminHow.sorted_by_position_all
  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_how = AdminHow.new
  end

  def create
    @admin_how = AdminHow.new(admin_how_params)
    if @admin_how.save
      respond_to do |format|
        format.html { redirect_to admin_hows_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_how = AdminHow.find params[:id]
  end

  def update
    @admin_how = AdminHow.find params[:id]
    if @admin_how.update_attributes(admin_how_params)
      respond_to do |format|
        format.html { redirect_to admin_hows_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE IMAGE

  def edit_image
    @admin_how = AdminHow.find(params[:id])
  end

  def change_image

    @admin_how = AdminHow.find params[:id]

    if @admin_how.update_attributes(admin_how_params)
      respond_to do |format|
        format.html { redirect_to admin_hows_path }
        format.js
      end
    else
      render('edit_image')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminHow
    redirect_to admin_hows_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminHow
    redirect_to admin_hows_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_hows = AdminHow.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_hows_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_how = AdminHow.find params[:id]
  end

  def destroy
    @admin_how = AdminHow.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_hows_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_how_params
    params.require(:admin_how).permit(
        :id,
        :heading,
        :content,
        :visible,
        :position,
        :image_url,
        :image_position,
        :image_size,
        :image_id,
        :image_id_color,
        :image_url_color

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

