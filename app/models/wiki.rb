class Wiki < ActiveRecord::Base
  attr_accessible :body, :title, :user, :user_ids, :private

  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  default_scope order('created_at DESC')

  def self.visible_to(user)
   user.role == 'premium' ? all : where(private: false)
  end
end
