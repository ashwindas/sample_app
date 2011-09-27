class Micropost < ActiveRecord::Base
  attr_accessible :content, :expense, :tag

  belongs_to :user

  validates :content, :presence => true, :length => { :maximum => 140 }
  validates :expense, :presence => true
  validates :tag, :presence => true, :length => { :maximum => 10 }
  validates :user_id, :presence => true

  default_scope :order => 'microposts.created_at DESC'
end