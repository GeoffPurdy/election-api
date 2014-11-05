class Vote < ActiveRecord::Base
  belongs_to :seat
  belongs_to :voter
  belongs_to :candidate
  validates :vote_id, uniqueness: { scope: :seat, presence: true }
end
