class Ticket < ApplicationRecord
  enum :state, %i[backlog next in_progress done], default: :backlog

  validates_presence_of :title, :description

  after_update_commit -> { broadcast_refresh_later_to("main-board") }
  after_create_commit  -> { broadcast_refresh_later_to("main-board") }
  after_destroy_commit -> { broadcast_refresh_later_to("main-board") }
end
