class FaqController < ApplicationController


  def index



    @admin_faqs = AdminFaq.sorted_by_position_visible

    logger.debug "FAQs in ORDER - #{@admin_faqs.inspect}"


  end


end
