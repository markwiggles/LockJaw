class AdminSectionsController < ApplicationController

  layout 'admin'


  def index

    @admin_tab = AdminTab.find params[:id]
    @admin_sections = AdminSection.where(admin_tab_id: params[:id]).order(:position)

    @admin_section = AdminSection.find(33)

  end

  # -------------------------------------------------------------------------
  # CREATE NEW SECTION

  def new
    @admin_tab = AdminTab.find params[:admin_tab_id]
    @admin_section = AdminSection.new({:admin_tab_id => @admin_tab.id})
  end

  def create_section
    @admin_section = AdminSection.new(admin_sections_params)
    if @admin_section.save
      respond_to do |format|
        format.html { redirect_to admin_sections_path :admin_tab_id => @admin_tab.id }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # EDIT SECTION

  def edit
    @admin_section = AdminSection.find(params[:id])
  end

  def update
    @admin_section = AdminSection.find params[:id]
    if @admin_section.update_attributes(admin_sections_params)
      respond_to do |format|
        format.html { redirect_to admin_sections_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE IMAGE

  def edit_image
    logger.debug "EDIT IMAGE #{params[:id]}"

    @admin_section = AdminSection.find(params[:id])

  end

  def change_image

    @admin_section = AdminSection.find params[:id]

    if @admin_section.update_attributes(admin_sections_params)
      respond_to do |format|
        format.html { redirect_to admin_sections_path }
        format.js
      end
    else
      render('edit_image')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE SECTION ORDER

  def update_section_order

    admin_tab_id = AdminSection.find(params[:id]).admin_tab_id

    edit_section_order params[:id], params[:new_position]

    redirect_to admin_section_path admin_tab_id
  end

  # -------------------------------------------------------------------------
  # # REFRESH THE SECTION VIEW

  def sections
    @admin_sections = AdminSection.where(admin_tab_id: params[:id]).order(:position)
    respond_to do |format|
      format.html { redirect_to admin_sections_path params[:admin_tab_id] }
      format.js
    end
  end

  # -------------------------------------------------------------------------
  # DELETE
  def delete_section
    @admin_section = AdminSection.find params[:id]
  end

  def destroy
    @admin_section = AdminSection.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_sections_path :id => @admin_section.admin_tab_id }
      format.js
    end
  end

  # -----------------------------------------------------------------------
  private

  def admin_sections_params
    params.require(:admin_section).permit(
        :id,
        :sub_heading,
        :content,
        :visible,
        :admin_tab_id,
        :image_url_tab,
        :image_position_tab,
        :image_size_tab,
        :image_url_blog,
        :image_position_blog,
        :image_size_blog,
        :image_id,
        :truncation
    )
  end

  def edit_section_order(id, new_position)
    # get the section using the id passed
    section = AdminSection.find(id)
    # update the new position
    section.update_attribute(:position, new_position)
  end


end
