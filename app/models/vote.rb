class Vote < ActiveRecord::Base
  belongs_to :seat
  belongs_to :voter
  belongs_to :candidate
end
