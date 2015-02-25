class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]
  before_action :current_user?, only: [:edit, :update, :destroy]

  # GET /flats
  def index
    @flats = Flat.all
  end

  # GET /flats/1
  def show
  end

  # GET /flats/new
  def new
    @flat = Flat.new
    @flat.flat_pics.build #line added to integrate flat_pic form in flat form
  end

  # GET /flats/1/edit
  def edit
  end

  # POST /flats
  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to @flat, notice: 'Flat was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /flats/1
  def update
    if @flat.update(flat_params)
      redirect_to @flat, notice: 'Flat was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /flats/1
  def destroy
    @flat.destroy
    redirect_to flats_url, notice: 'Flat was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flat
      @flat = Flat.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flat_params
      params.require(:flat).permit(:name, :description, :user_id, :city, :accomodates, :price, :has_AC, :has_jacuzzi, flat_pics_attributes:[:description, :picture])
    end

    def current_user?
        if current_user != @flat.user
          not_found
      end
    end
end
