class Wiki < ActiveRecord::Base
  attr_accessible :body, :title
  belongs_to :user
  belongs_to :collaborator

  default_scope order('created_at DESC')

end
