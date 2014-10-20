class TestimonialsController < ApplicationController
  def index

    @testimonials = AdminTestimonial.sorted_by_position_visible

  end
end
