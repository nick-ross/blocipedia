class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name
  # attr_accessible :title, :body
  has_many :wikis
  has_many :collaborations
  has_many :wiki_collaborations, through: :collaborations, source: :wiki
  has_one :subscription

  ROLES = %w[member premium]
  def role?(base_role)
  role.nil? ? false : ROLES.index(base_role.to_s) == ROLES.index(role)
  end

  def self.all_but(user)
    where.not(id: user.id)
  end


end
