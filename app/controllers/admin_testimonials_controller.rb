class AdminTestimonialsController < ApplicationController

  layout 'admin'


  def index
    @admin_testimonials = AdminTestimonial.sorted_by_position_all
  end


  # -------------------------------------------------------------------------
  # CREATE

  def new
    @admin_testimonial = AdminTestimonial.new
  end

  def create_testimonial
    @admin_testimonial = AdminTestimonial.new(admin_testimonial_params)
    if @admin_testimonial.save
      respond_to do |format|
        format.html { redirect_to admin_testimonials_path}
        format.js
      end
    else
      render('new')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE

  def edit
    @admin_testimonial = AdminTestimonial.find params[:id]
  end

  def update
    @admin_testimonial = AdminTestimonial.find params[:id]
    if @admin_testimonial.update_attributes(admin_testimonial_params)
      respond_to do |format|
        format.html { redirect_to admin_testimonials_path }
        format.js
      end
    else
      render('edit')
    end
  end

  # -------------------------------------------------------------------------
  # UPDATE LIST ORDER

  def update_list_order
    edit_list_order params[:id], params[:new_position], AdminTestimonial
    redirect_to admin_testimonials_path
  end

  # -------------------------------------------------------------------------
  # REFRESH THE LIST

  def testimonial_list

    @admin_testimonials = AdminTestimonial.sorted_by_position_all
    respond_to do |format|
      format.html { redirect_to admin_testimonials_path}
      format.js
    end
  end


  # -------------------------------------------------------------------------
  # DELETE
  def delete_testimonial
    logger.debug "HERERERERE"

    @admin_testimonial = AdminTestimonial.find params[:id]

    logger.debug "TESTIMONIAL ID #{@admin_testimonial.id}"
  end

  def destroy
    @admin_testimonial = AdminTestimonial.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to admin_testimonials_path }
      format.js
    end
  end


  # -------------------------------------------------------------------------

  private

  def admin_testimonial_params
    params.require(:admin_testimonial).permit(
        :content,
        :signature,
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

end



