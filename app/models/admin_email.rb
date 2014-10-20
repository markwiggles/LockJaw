class AdminEmail < ActiveRecord::Base

  before_save :create_image_urls

  validates :subject, :presence => {:message => '?'}
  validates :heading, :presence => {:message => '?'}
  validates :heading, :presence => {:message => '?'}



  scope :sorted_by_position_visible, lambda { where(:visible => true).order('position ASC') }

  scope :sorted_by_position_all, lambda { order('position ASC') }


  def create_image_urls
    if self.image_id != '' && self.image_id != nil
    self.image_url = create_url
    end
  end

  def default_image_id
    self.image_id ||= 'no_image'
  end


  def create_url
    appendix = '_t.jpg'
    # revert back to the backslashed version (from the html safe version)
    image_id = self.image_id.gsub '-', '/'
    # create the url
    "http://farm#{image_id}#{appendix}".html_safe
  end # end create_image_url



end