class License < ApplicationRecord
  include Paginatable
  include LikeSearchable
  validates :key, presence: true, uniqueness: { case_sensitive: false, scope: :platform }
  validates :platform, presence: true
  validates :status, presence: true
  enum platform: { steam: 1, battle_net: 2, origin: 3 }
  enum status: { available: 1, in_use: 2, inactive: 3 }
  belongs_to :game
end
