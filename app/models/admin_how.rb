class AdminHow < ActiveRecord::Base

  before_save :default_visibility, :default_image_id, :create_image_urls

  validates :content, :presence => {:message => '?'}

  scope :sorted_by_position_visible, lambda { where(:visible => true).order('position ASC') }

  scope :sorted_by_position_all, lambda { order('position ASC') }

  def default_visibility
    self.visible ||= 0
  end

  def create_image_urls
    if self.image_size != 'none' && self.image_size != nil
      self.image_url = create_url(self.image_size, self.image_id)
      self.image_url_color = create_url('large', self.image_id_color)
    end
  end

  def default_image_id
    self.image_id ||= 'no_image'
  end


  def create_url(image_size, this_image_id)

    # # associate the size with the required appendix
    # if image_size == 'medium'
    #   appendix = '_q.jpg'
    # elsif image_size == 'large'
    appendix = '_m.jpg'
    # else
    #   appendix = '_s.jpg'
    # end

    # revert back to the backslashed version (from the html safe version)
    this_image_id = this_image_id.gsub '-', '/'
    # create the url
    "http://farm#{this_image_id}#{appendix}".html_safe

  end # end create_image_url


end