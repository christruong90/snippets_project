class Snippet < ActiveRecord::Base

  belongs_to :category

  validates :title, presence: true, uniqueness: true

  validates :work, presence: true

end
