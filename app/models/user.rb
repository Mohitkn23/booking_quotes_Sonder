class User < ApplicationRecord
  has_many :inquiries 
  before_save { self.email = email.downcase } #To store all the emails in DB in down/lowercase
  #User validation. Must always be present, Must be unique and 
  #the length should be between 3 & 50 characters included.
  validates :firstname, presence: true, 
            uniqueness: {case_sensitive: false},
            length: { minimum: 3 , maximum: 50 }
            
  validates :lastname, presence: true, 
            uniqueness: {case_sensitive: false},
            length: { minimum: 3 , maximum: 50 }
            
  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  
  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }
end
