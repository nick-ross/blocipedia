class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :user, :user_ids
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  default_scope order('created_at DESC')
end
