class AdminSocialMediasController < ApplicationController

  layout 'admin'


  def index
    @admin_social_medias = AdminSocialMedia.sorted_by_position_all
  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_social_media = AdminSocialMedia.new
  end

  def create
    @admin_social_media = AdminSocialMedia.new(admin_social_media_params)
    if @admin_social_media.save
      respond_to do |format|
        format.html { redirect_to admin_social_medias_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_social_media = AdminSocialMedia.find params[:id]
  end

  def update
    @admin_social_media = AdminSocialMedia.find params[:id]
    if @admin_social_media.update_attributes(admin_social_media_params)
      respond_to do |format|
        format.html { redirect_to admin_social_medias_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE IMAGE

  def edit_image
    @admin_social_media = AdminSocialMedia.find(params[:id])
  end

  def change_image

    @admin_social_media = AdminSocialMedia.find params[:id]

    if @admin_social_media.update_attributes(admin_social_media_params)
      respond_to do |format|
        format.html { redirect_to admin_social_medias_path }
        format.js
      end
    else
      render('edit_image')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminSocialMedia
    redirect_to admin_social_medias_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminSocialMedia
    redirect_to admin_social_medias_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_social_medias = AdminSocialMedia.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_social_medias_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_social_media = AdminSocialMedia.find params[:id]
  end

  def destroy
    @admin_social_media = AdminSocialMedia.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_social_medias_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_social_media_params
    params.require(:admin_social_media).permit(
        :id,
        :link,
        :content,
        :alt,
        :visible,
        :position,
        :image_url,
        :image_id,
        :original_secret,
        :original_image_url
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

