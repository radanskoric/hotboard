require "application_system_test_case"

class TicketsTest < ApplicationSystemTestCase
  setup do
    @ticket = tickets(:one)
  end

  test "visiting the index" do
    visit tickets_url
    assert_selector "h1", text: "Tickets"
  end

  test "visiting the home page" do
    visit root_url
    assert_selector "h1", text: "Tickets"
  end

  test "should create ticket" do
    visit tickets_url
    click_on "New ticket"

    fill_in "Description", with: @ticket.description
    fill_in "Title", with: @ticket.title
    click_on "Create Ticket"

    assert_text "Ticket was successfully created"
    click_on "Back"
  end

  test "should update Ticket" do
    visit tickets_url
    within "turbo-frame##{dom_id(@ticket)}" do
      click_on "Edit this ticket"

      fill_in "Description", with: "New ticket description"
      fill_in "Title", with: "New ticket title"
      click_on "Update Ticket"
    end

    assert_text "New ticket title"
    assert_no_text @ticket.title

    # Doesn't work by default. Try and fix it as an exercise after learning about Turbo Streams.
    # assert_text "Ticket was successfully updated"
  end

  test "should destroy Ticket" do
    visit ticket_url(@ticket)
    click_on "Destroy this ticket", match: :first

    assert_text "Ticket was successfully destroyed"
  end
end
