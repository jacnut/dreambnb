class FlatPicsController < ApplicationController
  before_action :find_flat
  before_action :set_flat_pic, only: [:show, :edit, :update, :destroy]
  before_action :current_user?, only: [:index, :show, :edit, :update, :destroy]

  # GET /flat_pics
  def index
    @flat_pics = @flat.flat_pics
    @flat_pic = FlatPic.new
  end

  # GET /flat_pics/1
  def show
    @flat.flat_pics(@flat_pic)
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
    @flat_pic = @flat.flat_pics.build(flat_pic_params)

    if @flat_pic.save
      redirect_to flat_path(@flat), notice: 'Your image was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /flat_pics/1
  def update
    if @flat_pic.update(flat_pic_params)
      redirect_to flat_path(@flat), notice: 'Your image was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /flat_pics/1
  def destroy
    @flat_pic.destroy
    redirect_to flat_path(@flat), notice: 'Your image was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flat_pic
      @flat_pic = @flat.flat_pics.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def flat_pic_params
      params.require(:flat_pic).permit(:description, :flat_id, :picture)
    end

    def find_flat
      @flat = Flat.find(params[:flat_id])
    end

    def current_user?
      if current_user != @flat.user
        not_found
      end
    end
end
