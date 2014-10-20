class AdminBuypostersController < ApplicationController

  layout 'admin'


  def index
    @admin_buyposters = AdminBuyposter.sorted_by_position_all
  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_buyposter = AdminBuyposter.new
  end

  def create
    @admin_buyposter = AdminBuyposter.new(admin_buyposter_params)
    if @admin_buyposter.save
      respond_to do |format|
        format.html { redirect_to admin_buyposters_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_buyposter = AdminBuyposter.find params[:id]
  end

  def update
    @admin_buyposter = AdminBuyposter.find params[:id]
    if @admin_buyposter.update_attributes(admin_buyposter_params)
      respond_to do |format|
        format.html { redirect_to admin_buyposters_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE IMAGE

  def edit_image
    @admin_buyposter = AdminBuyposter.find(params[:id])
  end

  def change_image

    @admin_buyposter = AdminBuyposter.find params[:id]

    if @admin_buyposter.update_attributes(admin_buyposter_params)
      respond_to do |format|
        format.html { redirect_to admin_buyposters_path }
        format.js
      end
    else
      render('edit_image')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminBuyposter
    redirect_to admin_buyposters_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminBuyposter
    redirect_to admin_buyposters_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_buyposters = AdminBuyposter.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_buyposters_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_buyposter = AdminBuyposter.find params[:id]
  end

  def destroy
    @admin_buyposter = AdminBuyposter.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_buyposters_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_buyposter_params
    params.require(:admin_buyposter).permit(
        :id,
        :link,
        :visible,
        :position,
        :image_url,
        :image_id,
        :alt
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

