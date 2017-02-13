class ImagesController < ApplicationController
  before_action :set_album
  before_action :set_image, only: [:show, :edit, :update, :destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/1
  # GET /images/1.json
  def show
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # GET /images/1/edit
  def edit
  end

  # POST /images
  # POST /images.json
  def create
    @image = Image.new(image_params)
    @image.album_id = @album.id

    respond_to do |format|
      if @image.save
        format.html { redirect_to album_image_path(album_id: @album.uid, id: @image.uid), notice: 'Image was successfully created.' }
        format.json { render :show, status: :created, location: @image }
      else
        format.html { render :new }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /images/1
  # PATCH/PUT /images/1.json
  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
        format.json { render :show, status: :ok, location: @image }
      else
        format.html { render :edit }
        format.json { render json: @image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_album
      @album = Album.find_by_uid(params[:album_id])
      raise "Album not found" if @album.blank?
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = @album.images.find_by_uid(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:name, :description, :image_file)
    end
end
