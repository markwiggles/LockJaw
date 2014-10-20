class BlogsController < ApplicationController

  def index

    @admin_tabs_visible = AdminTab.visible

  end

  def show

    @tab = AdminTab.find(params[:id])
    @sections = AdminSection.find_tab_id_equal_to @tab.id

    @admin_tabs_visible = AdminTab.visible

  end
end
