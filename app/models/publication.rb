class Publication < ActiveRecord::Base
  attr_accessible :annee, :mois, :nom, :notes, :pages, :resume, :titre, :typePublication
   has_many :relationships, foreign_key: "publication_id", dependent: :destroy
   has_many :authors_publication, through: :relationships, source: :author
   VALID_YEAR_REGEX = /\d{4}/
  validates :annee, presence:   true, format: { with: VALID_YEAR_REGEX }
  validates :titre, presence: true, length: { maximum: 49 }
  validates :typePublication, presence: true, length: { maximum: 49 }
  validates :nom, presence: true, length: { maximum: 49 }
  validates :mois, presence: true, length: { maximum: 10 }
  validates :pages, presence: true, length: { maximum: 8}
   validates :notes, presence: true, length: { maximum: 140 }
   validates :resume, presence: true, length: { maximum: 140 }
   def having?(other_author)
    relationships.find_by_author_id(other_author.id)
  end

  def have!(other_author)
    relationships.create!(author_id: other_author.id)
  end
  def unhave!(other_author)
    relationships.find_by_author_id(other_author.id).destroy
  end
end
