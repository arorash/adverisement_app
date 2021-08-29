class AdvertisementsController < ApplicationController
  before_action :set_advertisement, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
  # GET /advertisements or /advertisements.json
  def index
    @advertisements = Advertisement.all
  end
  
  # GET /advertisements/1 or /advertisements/1.json
  def show
  end

  # GET /advertisements/new
  def new
    #@advertisement = Advertisement.new
    @advertisement = current_user.advertisement.build
  end

  # GET /advertisements/1/edit
  def edit
  end

  # POST /advertisements or /advertisements.json
  def create
    #@advertisement = Advertisement.new(advertisement_params)
    @advertisement = current_user.advertisement.build(advertisement_params)
    respond_to do |format|
      if @advertisement.save
        format.html { redirect_to @advertisement, notice: "Advertisement was successfully created." }
        format.json { render :show, status: :created, location: @advertisement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /advertisements/1 or /advertisements/1.json
  def update
    respond_to do |format|
      if @advertisement.update(advertisement_params)
        format.html { redirect_to @advertisement, notice: "Advertisement was successfully updated." }
        format.json { render :show, status: :ok, location: @advertisement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @advertisement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /advertisements/1 or /advertisements/1.json
  def destroy

    @user_comment = @advertisement.user_comments
    @user_comment.destroy
    @advertisement.destroy
    respond_to do |format|
      format.html { redirect_to advertisements_url, notice: "Advertisement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @advertisement = current_user.advertisement.find_by(id: params[:id])
    redirect_to advertisements_path, notice: "Not Allowed" if @advertisement.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_advertisement
      @advertisement = Advertisement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def advertisement_params
      params.require(:advertisement).permit(:title, :offer, :discription, :user_id, :publish_status)
    end
end
