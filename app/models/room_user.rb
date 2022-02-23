class RoomUser < ApplicationRecord
  belings_to :room
  belongd_to :user
end
