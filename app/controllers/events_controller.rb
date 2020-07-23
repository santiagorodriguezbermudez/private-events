class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
    @upcoming = Event.upcoming.pluck(:name, :date, :location, :description, :id)
    @past = Event.past.pluck(:name, :date, :location, :description, :id)
  end

  def create
    @event = Event.new(event_params)
    @event.creator_id = current_user.id
    respond_to do |format|
      if @event.save
        format.html { redirect_to events_path, notice: 'Event was successfully created.' }
        # format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def invite
    invitee = User.find_by(username: params[:username])
    UserEvent.create(attendee_id: invitee.id, attended_event_id: params[:event_id]) unless invitee.nil?
    redirect_to "/events/#{params[:event_id]}"
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :description)
  end
end
