class AdminHomesController < ApplicationController

  include ApplicationHelper

  before_filter :require_login


  layout 'admin'


  def index

    @current_page = 'Home'

  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_home = AdminHome.new
  end

  def create
    @admin_home = AdminHome.new(admin_home_params)
    if @admin_home.save
      respond_to do |format|
        format.html { redirect_to admin_homes_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_home = AdminHome.find params[:id]
  end

  def update
    @admin_home = AdminHome.find params[:id]
    if @admin_home.update_attributes(admin_home_params)
      respond_to do |format|
        format.html { redirect_to admin_homes_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE IMAGE

  def edit_image
    @admin_home = AdminHome.find(params[:id])
  end

  def change_image

    @admin_home = AdminHome.find params[:id]

    if @admin_home.update_attributes(admin_home_params)
      respond_to do |format|
        format.html { redirect_to admin_homes_path }
        format.js
      end
    else
      render('edit_image')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminHome
    redirect_to admin_homes_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminHome
    redirect_to admin_homes_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_homes = AdminHome.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_homes_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_home = AdminHome.find params[:id]
  end

  def destroy
    @admin_home = AdminHome.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_homes_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_home_params
    params.require(:admin_home).permit(
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

