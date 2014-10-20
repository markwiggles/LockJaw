class AdminTab < ActiveRecord::Base
  has_many :admin_sections

  validates :name, :presence => {:message => '?'}


  default_scope {order('position DESC')}

  scope :sorted_rev, lambda {order 'position ASC'}

  scope :sorted_visible, lambda {order 'visible DESC'}

  scope :visible, lambda {where :visible => true}

  scope :joined, lambda {self.select('admin_tabs.*, admin_sections.*').joins(:admin_sections)}


  validates_presence_of :name

end
