class Tweet < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_one_attached :image
end
