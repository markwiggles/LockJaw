class AdminSocialMedia < ActiveRecord::Base

  before_save :create_image_urls

  validates :link, :presence => {:message => '?'}
  validates :alt, :presence => {:message => '?'}


  scope :sorted_by_position_visible, lambda { where(:visible => true).order('position ASC') }

  scope :sorted_by_position_all, lambda { order('position ASC') }

  def create_image_urls
    if self.image_id != '' && self.image_id != nil
    self.image_url = create_url  #self.image_size
    self.original_image_url = create_original_url
    end
  end

  def default_image_id
    self.image_id ||= 'no_image'
  end


  def create_url

    # default size is thumbnail
    appendix = '_s.jpg'

    # revert back to the backslashed version (from the html safe version)
    image_id = self.image_id.gsub '-', '/'
    # create the url
    "http://farm#{image_id}#{appendix}".html_safe

  end # end create_image_url

  def create_original_url

    appendix = '_o.png'

    # revert back to the backslashed version (from the html safe version)
    image_id = self.image_id.gsub '-', '/'

    # replace the secret with the original secret

    image_id = image_id[0...-10]
    logger.debug "#{image_id}"


    # create the url
    "http://farm#{image_id}#{self.original_secret}#{appendix}".html_safe

  end # end create_image_url


end
