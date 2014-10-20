class AdminBuymsgsController < ApplicationController


  layout 'admin'


  def index
    @admin_buymsgs = AdminBuymsg.sorted_by_position_all
    @buymsg_current = AdminBuymsg.sorted_by_position_visible.first
    @buymsg_first = AdminBuymsg.sorted_by_position_all.first
    @spree_price = Spree::Price.find(1).amount
  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_buymsg = AdminBuymsg.new
  end

  def create
    @admin_buymsg = AdminBuymsg.new(admin_buymsg_params)
    if @admin_buymsg.save
      respond_to do |format|
        format.html { redirect_to admin_buymsgs_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_buymsg = AdminBuymsg.find params[:id]

  end

  def update
    @admin_buymsg = AdminBuymsg.find params[:id]
    if @admin_buymsg.update_attributes(admin_buymsg_params)
      respond_to do |format|
        format.html { redirect_to admin_buymsgs_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminBuymsg
    redirect_to admin_buymsgs_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminBuymsg
    redirect_to admin_buymsgs_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_buymsgs = AdminBuymsg.sorted_by_position_all
    @buymsg_current = AdminBuymsg.sorted_by_position_visible.first
    @buymsg_first = AdminBuymsg.sorted_by_position_all.first
    @spree_price = Spree::Price.find(1).amount
    respond_to do |format|
      format.html { redirect_to admin_buymsgs_path }
      format.js
    end
  end
  # -------------------------------------------------------------------------
  # # REFRESH THE PRICE-BOXES VIEW

  def price_boxes

    respond_to do |format|
      format.html { redirect_to admin_buymsg_path }
      format.js
    end
  end

  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_buymsg = AdminBuymsg.find params[:id]
  end

  def destroy
    @admin_buymsg = AdminBuymsg.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_buymsgs_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_buymsg_params
    params.require(:admin_buymsg).permit(
        :id,
        :message,
        :letter_spacing,
        :visible,
        :position
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




