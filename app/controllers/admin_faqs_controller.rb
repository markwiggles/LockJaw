class AdminFaqsController < ApplicationController


  layout 'admin'


  def index
    @admin_faqs = AdminFaq.sorted_by_position_all
  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_faq = AdminFaq.new
  end

  def create
    @admin_faq = AdminFaq.new(admin_faq_params)
    if @admin_faq.save
      respond_to do |format|
        format.html { redirect_to admin_faqs_path }
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_faq = AdminFaq.find params[:id]
  end

  def update
    @admin_faq = AdminFaq.find params[:id]
    if @admin_faq.update_attributes(admin_faq_params)
      respond_to do |format|
        format.html { redirect_to admin_faqs_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminFaq
    redirect_to admin_faqs_path
  end

  # -------------------------------------------------------------------------
  # UPDATE VISIBILITY

  def update_visibility
    edit_visibility params[:id], params[:new_visibility], AdminFaq
    redirect_to admin_faqs_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def list
    @admin_faqs = AdminFaq.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_faqs_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete

    @admin_faq = AdminFaq.find params[:id]
  end

  def destroy
    @admin_faq = AdminFaq.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_faqs_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_faq_params
    params.require(:admin_faq).permit(
        :id,
        :question,
        :answer,
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




