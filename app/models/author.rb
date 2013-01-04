class Author < ActiveRecord::Base
  attr_accessible :nom, :prenom
  belongs_to :user

  
  validates :nom, presence: true, length: { maximum: 140 }
  validates :prenom, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  default_scope order: 'authors.nom ASC'
end
