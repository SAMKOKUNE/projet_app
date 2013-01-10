class Author < ActiveRecord::Base
  attr_accessible :nom, :prenom
  belongs_to :user
  has_many :relationships, foreign_key: "author_id", dependent: :destroy
  has_many :publication_authors, through: :relationships, source: :publication
  validates :nom, presence: true, length: { maximum: 140 }
  validates :prenom, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  default_scope order: 'authors.nom ASC'
  def having?(other_publication)
    relationships.find_by_publication_id(other_publication.id)
  end

  def have!(other_publication)
    relationships.create!(publication_id: other_publication.id)
  end
  def unhave!(other_publication)
    relationships.find_by_publication_id(other_publication.id).destroy
  end
end
