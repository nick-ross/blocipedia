class Collaborator < ActiveRecord::Base
  attr_accessible :user_id, :wiki_id
  has_many :wikis
  has_many :users, through: :wikis
end
