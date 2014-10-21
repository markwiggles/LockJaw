class AdminTabsController < ApplicationController

  layout 'admin'

  def index
    @admin_tabs = AdminTab.all
    @admin_tabs_rev = AdminTab.sorted_rev
    @admin_tabs_visible = AdminTab.visible
  end


  # -------------------------------------------------------------------------
  # CREATE NEW TAB

  def new
    @admin_tab = AdminTab.new
  end

  def create_tab
    @admin_tab = AdminTab.new(admin_tab_params)
    if @admin_tab.save
      respond_to do |format|
        format.html { redirect_to admin_tabs_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE TAB

  def edit
    @admin_tab = AdminTab.find params[:id]
  end

  def update
    @admin_tab = AdminTab.find params[:id]
    if @admin_tab.update_attributes(admin_tab_params)
      respond_to do |format|
        format.html { redirect_to admin_tabs_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE TAB ORDER

  def update_tab_order
    edit_tab_order params[:id], params[:new_position]
    redirect_to admin_tabs_path
  end

  # -------------------------------------------------------------------------
  # UPDATE TAB VISIBILITY

  def update_tab_visibility
    edit_tab_visibility params[:id], params[:new_visibility]
    redirect_to admin_tabs_path
  end

  # -------------------------------------------------------------------------
  # SHOW SORTABLE TABS

  def sortable
    @admin_tabs_visible = AdminTab.visible
    respond_to do |format|
      format.html { redirect_to admin_tabs_path }
      format.js
    end
  end

  # -------------------------------------------------------------------------
  # REFRESH THE TABLE

  def tableview
    @admin_tabs_rev = AdminTab.sorted_rev
    respond_to do |format|
      format.html { redirect_to admin_tabs_path }
      format.js
    end
  end

  # -------------------------------------------------------------------------
  # DELETE
  def delete_tab
    @admin_tab = AdminTab.find params[:id]
  end

  def destroy
   @admin_tab = AdminTab.find(params[:id]).destroy
    respond_to do |format|
      format.html {redirect_to admin_tabs_path}
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_tab_params
    params.require(:admin_tab).permit(
        :name,
        :heading,
        :visible,
        :position
    )
  end

  def edit_tab_order(tab_id, new_tab_position)
    # get the tab using the id passed
    tab = AdminTab.find(tab_id)
    # update the new position
    if tab.update_attribute(:position, new_tab_position)
    end
  end

  def edit_tab_visibility(tab_id, visibility)
    # get the tab using the id passed
    tab = AdminTab.find(tab_id)
    # update the new visibility
    if tab.update_attribute(:visible, visibility)
      logger.debug "updated tab #{tab.id} to #{tab.visible}"
    end
  end

  def edit_tab(admin_tab)
    # get the tab using the id passed
    tab = AdminTab.find(admin_tab.id)
    # update tab
    if tab.update(admin_tab_params)
      logger.debug "updated tab #{admin_tab.id}"
    end
  end


end
