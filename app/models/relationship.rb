class Relationship < ActiveRecord::Base
  attr_accessible :publication_id, :author_id
  
  belongs_to :author
  belongs_to :publication
  validates :author_id, presence: true
  validates :publication_id, presence: true
end
