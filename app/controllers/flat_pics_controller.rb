class FlatPicsController < ApplicationController
  before_action :set_flat_pic, only: [:show, :edit, :update, :destroy]

  # GET /flat_pics
  def index
    @flat_pics = FlatPic.all
  end

  # GET /flat_pics/1
  def show
  end

  # GET /flat_pics/new
  def new
    @flat_pic = FlatPic.new
  end

  # GET /flat_pics/1/edit
  def edit
  end

  # POST /flat_pics
  def create
    @flat_pic = FlatPic.new(flat_pic_params)

    if @flat_pic.save
      redirect_to @flat_pic, notice: 'Flat pic was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /flat_pics/1
  def update
    if @flat_pic.update(flat_pic_params)
      redirect_to @flat_pic, notice: 'Flat pic was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /flat_pics/1
  def destroy
    @flat_pic.destroy
    redirect_to flat_pics_url, notice: 'Flat pic was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flat_pic
      @flat_pic = FlatPic.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flat_pic_params
      params.require(:flat_pic).permit(:description, :flat_id)
    end
end
