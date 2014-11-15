class Shot < ActiveRecord::Base
  extend Dragonfly::Model

  dragonfly_accessor :image

  belongs_to :user

  validates :image, presence: true
end
