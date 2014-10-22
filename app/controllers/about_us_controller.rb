class AboutUsController < ApplicationController


  def index

    @current_page = 'About Us'

    @about_us = AdminAbout.sorted_by_position_visible


  end
end
