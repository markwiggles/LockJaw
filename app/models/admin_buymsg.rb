class AdminBuymsg < ActiveRecord::Base

  before_save :default_letter_space

  validates :message, :presence => {:message => '?'}



  scope :sorted_by_position_visible, lambda { where(:visible => true).order('position ASC') }

  scope :sorted_by_position_all, lambda { order('position ASC') }


  def default_letter_space
    self.letter_spacing ||= 0
  end

end