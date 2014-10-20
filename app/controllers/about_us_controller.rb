class AboutUsController < ApplicationController


  def index

    @about_us = AdminAbout.sorted_by_position_visible


  end
end
