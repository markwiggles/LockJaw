class TestimonialsController < ApplicationController
  def index

    @current_page = 'Testimonials'

    @testimonials = AdminTestimonial.sorted_by_position_visible

  end
end
