module ApplicationHelper

  require 'rest_client'

  include Spree::Core::ControllerHelpers


  def add_paragraph_breaks(content)
    content = content.gsub('\n', '</p><p>').html_safe
    add_html_helpers content
  end

  def add_double_line_breaks(content)
    content =content.gsub('\n', '<br><br>').html_safe
    add_html_helpers content
  end

  def add_single_line_breaks(content)
    content =content.gsub('\n', '<br>').html_safe
    add_html_helpers content
  end


  def add_html_helpers(content)
    content = content.gsub('b-', '<strong>').html_safe
    content = content.gsub('-b', '</strong>').html_safe
    content = content.gsub('i-', '<i>').html_safe
    content = content.gsub('-i', '</i>').html_safe
    content = content.gsub('l-', '<span class="lead">').html_safe
    content = content.gsub('-l', '</span>').html_safe
    content = content.gsub('u-', '<u>').html_safe
    content = content.gsub('-u', '</u>').html_safe
    content = content.gsub('h-', '<span class="lead"><strong>').html_safe
    content = content.gsub('-h', '</strong></span>').html_safe

    content = content.gsub('s-p', '&nbsp').html_safe

    content = content.gsub('c1-', '<span class="text-primary">').html_safe
    content = content.gsub('-c1', '</span>').html_safe
    content = content.gsub('c2-', '<span class="text-color-red">').html_safe
    content = content.gsub('-c2', '</span>').html_safe
    content = content.gsub('c3-', '<span class="text-success">').html_safe
    content = content.gsub('-c3', '</span>').html_safe
  end


  # -----------------------------------------------------------------------
  # Method to call flickr pics
  def get_flickr_pics (photoset)

    api_key = '0dd1537c46575cf8b7b2a2df94156fd9'
    method = 'flickr.photosets.getPhotos'
    format = 'json'

    #for testing
    user_id = '128529405@N05'
    photoset_id = '72157648179656437' #ladder pics

    base_url = 'https://api.flickr.com/services/rest/'

    response = RestClient.get base_url, {
        :params => {
            'api_key' => api_key,
            'photoset_id' => photoset,
            'method' => method,
            'format' => format,
            'nojsoncallback' => 1,
            'extras' => 'original_format'
        }
    }

    return response

  end

  def show_heading_if_available(attribute)
    attribute.heading == '' ? 'hide-elem' : 'text-primary'
  end

  def dim_if_not_currently_visible(attribute)

    if !attribute.visible?
      "class ='opaque'"
    end

  end

  def change_image_url_to_thumbnail(image_url)

    image_url = image_url.gsub('_m', '_s')
    image_url = image_url.gsub('_q', '_s')
    image_url.gsub('_n', '_s')

  end

  def require_login
    if spree_current_user
      unless spree_current_user.has_spree_role?('admin')
        redirect_to spree_login_path
      end
    else
      redirect_to spree_login_path

    end
  end

  def spree_admin_user
    if spree_current_user
        spree_current_user
    end
  end


end


# @spree_admin_users = Spree::User.admin.inspect
#
# @spree_current_user = spree_current_user.has_spree_role?('admin')
#
#
# logger.debug "SPREE USER #{@spree_current_user}"
#
# @spree_admin_users = Spree::User.admin
#
# @spree_admin_users.each do |user|
#
#   logger.debug user.login
#
# end