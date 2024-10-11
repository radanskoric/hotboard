class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update update_state destroy ]

  # GET /tickets
  def index
    @tickets = Ticket.all.group_by(&:state)
    @ticket = Ticket.new
  end

  # GET /tickets/1
  def show
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
  end

  # GET /tickets/1/edit
  def edit
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      flash.notice = "Ticket was successfully created."
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @ticket }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket, notice: "Ticket was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_state
    @ticket.update(state: params.require(:state))
    redirect_back_or_to root_path
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy!
    redirect_to root_path, notice: "Ticket was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.expect(ticket: [ :title, :description ])
    end
end
