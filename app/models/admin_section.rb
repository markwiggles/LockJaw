class AdminSection < ActiveRecord::Base
  belongs_to :admin_tab

  before_save :default_truncation, :default_image_id, :create_image_urls


  scope :find_tab_id_equal_to, lambda { |tab_id| where 'admin_tab_id = ? and visible = 1', "#{tab_id}" }


  validates :content, :presence => {:message => '?'}


  # method to run before saving,
  # to create the image urls for the tab and the blog, according to each image size

  def create_image_urls

    if self.image_size_tab != 'none' && self.image_size_tab != nil
      self.image_url_tab = create_url self.image_size_tab
      self.image_url_blog = create_url self.image_size_blog


    end

  end


  def default_truncation
    self.truncation ||= 230
  end

  def default_image_id
    self.image_id ||= 'no_image'
  end


  def create_url (image_size)

    # associate the size with the required appendix
    if image_size == 'medium'
      appendix = '_q.jpg'
    elsif image_size == 'large'
      appendix = '_m.jpg'
    else
      appendix = '_s.jpg'
    end

    # revert back to the backslashed version (from the html safe version)
    image_id = self.image_id.gsub '-', '/'
    # create the url
    "http://farm#{image_id}#{appendix}".html_safe
  end # end create_image_url

end


