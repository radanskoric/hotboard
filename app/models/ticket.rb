class Ticket < ApplicationRecord
  validates_presence_of :title, :description

  after_update_commit -> { broadcast_refresh_later_to("main-board") }
  after_create_commit  -> { broadcast_refresh_later_to("main-board") }
  after_destroy_commit -> { broadcast_refresh_later_to("main-board") }
end
