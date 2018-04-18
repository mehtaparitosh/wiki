class Article < ApplicationRecord
  acts_as_votable

  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
end
