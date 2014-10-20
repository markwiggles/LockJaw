class HomeController < ApplicationController

  layout 'default'

  def index
    @admin_tabs_visible = AdminTab.visible
    @testimonials = AdminTestimonial.sorted_by_position_visible
    @spree_price = Spree::Price.find(1).amount
    @poster = AdminBuyposter.sorted_by_position_visible.first
    @buymsg = AdminBuymsg.sorted_by_position_visible.first
    @social_medias = AdminSocialMedia.sorted_by_position_visible
  end

  def brochure
    File.open('public/files/lockjawbrochure_v1.1.pdf', 'rb') do |f|
      send_data f.read, :type => 'application/pdf', :disposition => 'inline'
    end
  end


  def get_json_photos
    # assign the response by calling the helper method, passing in the photoset id
    @photos = view_context.get_flickr_pics(params[:photoset_id])
    render :text => @photos.to_json
  end


end
