class AdminTestimonial < ActiveRecord::Base


  validates :content, :presence => {:message => '?'}
  validates :signature, :presence => {:message => '?'}


  scope :sorted_by_position_visible, lambda {where(:visible => true).order('position ASC')}

  scope :sorted_by_position_all, lambda { order('position ASC') }

end
