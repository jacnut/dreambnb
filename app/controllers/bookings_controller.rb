class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :set_user_flat

  # GET /bookings
  def index
    @bookings = Booking.all
  end

  # GET /bookings/1
  def show
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings
  def create
    #Need to convert the two dates into Ruby dates
    start_date = DateTime.strptime(booking_params[:start_date], '%d/%m/%Y')
    end_date = DateTime.strptime(booking_params[:end_date], '%d/%m/%Y')
    @booking = Booking.new(start_date:start_date, end_date:end_date, user_id:current_user.id, flat_id:booking_params[:flat_id])
    @booking.user = current_user
    @booking.flat = Flat.find(booking_params[:flat_id])

    if Booking.booked?(booking_params[:flat_id], start_date, end_date)
      redirect_to new_booking_path(flat_id: booking_params[:flat_id]), notice: 'Sorry your venue is already booked at these dates'
    elsif Booking.start_date_after_end_date?(start_date, end_date)
      redirect_to new_booking_path(flat_id: booking_params[:flat_id]), notice: 'No time-machines, End date must be after Start date'
    elsif @booking.save
      redirect_to @booking, notice: 'Dear ' + @booking.user.email + ', your booking at ' + @booking.flat.name + ' was successfully created.'
      UserMailer.booking(@booking.user, @booking.flat, @booking.start_date, @booking.end_date).deliver
    else
      redirect_to new_booking_path(flat_id: booking_params[:flat_id]), notice: 'STOP living in the past, dates in the futur only please'
      #need to redirect (and not render) take the id of the flat)
    end
  end

  # PATCH/PUT /bookings/1
  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def set_user_flat
      @user = current_user
      @flat = Flat.where(id: params[:flat_id]).first
    end

    # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :user_id, :flat_id)
    end
end
