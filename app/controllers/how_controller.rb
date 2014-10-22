class HowController < ApplicationController

  def index

    @current_page = 'How-it-Works'

    @admin_hows_visible = AdminHow.sorted_by_position_visible

  end


  def get_json_photos

    # assign the response by calling the helper method, passing in the photoset id
    @photos = view_context.get_flickr_pics(params[:photoset_id])
    render :text => @photos.to_json

  end



end
