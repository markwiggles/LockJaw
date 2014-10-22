class AdminMessage < ActiveRecord::Base


  scope :sorted, lambda {order('contacts.created_at DESC')}


  EMAIL_REGEX = /\A\S+@\S+\.\S+|z/


  validates :message, :presence => {:message => '?'},:length => {:minimum => 3, :message => '? ?'}
  validates :name, :presence => {:message => '?'}, :length => {:minimum => 2, message: 'too short'}
  validates :email, :presence => {:message => '?'}, :format => EMAIL_REGEX


  # validate :check_bad_words


  def send_mail
    AdminMessageMailer.send_mail_to_contact(self).deliver
  end

  def send_copy
    AdminMessageMailer.send_mail_copy(self).deliver
  end

end