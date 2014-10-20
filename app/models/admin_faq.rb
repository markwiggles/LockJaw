class AdminFaq < ActiveRecord::Base

  before_save :default_visibility

  validates :question, :presence => {:message => '?'}
  validates :answer, :presence => {:message => '?'}


  scope :sorted_by_position_visible, lambda { where(:visible => true).order('position ASC') }

  scope :sorted_by_position_all, lambda { order('position ASC') }


  def default_visibility
    self.visible ||= 0
  end

end
