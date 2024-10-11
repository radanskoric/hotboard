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

    within "[data-ticket-state='next']" do
      click_on "New ticket"

      fill_in "Description", with: "New ticket description"
      fill_in "Title", with: "New ticket title"
      click_on "Create Ticket"
    end

    assert_text "New ticket title"
    assert_text "Ticket was successfully created"
  end

  test "should allow canceling new ticket creation" do
    visit root_url

    within "[data-ticket-state='next']" do
      click_on "New ticket"

      fill_in "Title", with: "New ticket title"
      click_on "Cancel"
    end

    assert_no_text "New ticket title"
    assert_no_text "Ticket was successfully created"
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

    # Note for reader: This doesn't work by default.
    # You can try and fix it as an exercise after learning about Turbo Streams.
    # And well done for checking the tests and finding this!
    # assert_text "Ticket was successfully updated"
  end

  test "should allow updating the ticket while adding a new ticket" do
    visit root_url
    within "turbo-frame##{dom_id(@ticket)}" do
      click_on "Edit this ticket"
      fill_in "Title", with: "Updated ticket title"
    end

    within "[data-ticket-state='next']" do
      click_on "New ticket"
      within "turbo-frame#new_ticket_with_state_next" do
        fill_in "Description", with: "New ticket description"
        fill_in "Title", with: "New ticket title"
        click_on "Create Ticket"
      end
      assert_text "New ticket title"
    end

    within "turbo-frame##{dom_id(@ticket)}" do
      click_on "Update Ticket"
    end

    assert_text "Updated ticket title"
    assert_no_text @ticket.title
  end

  test "should destroy Ticket" do
    visit ticket_url(@ticket)
    within "turbo-frame#ticket_#{@ticket.id}" do
      click_on "Destroy this ticket"
    end

    assert_text "Ticket was successfully destroyed"
    assert_no_text @ticket.title
  end
end
