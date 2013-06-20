class MassagesController < ApplicationController
  before_action :set_massage, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /massages
  # GET /massages.json
  def index
    @massages = Massage.all
  end

  # GET /massages/1
  # GET /massages/1.json
  def show
  end

  # GET /massages/new
  def new
    @massage = Massage.new
  end

  # GET /massages/1/edit
  def edit
  end

  # POST /massages
  # POST /massages.json
  def create
    @massage = Massage.new(massage_params)

    respond_to do |format|
      if @massage.save
        format.html { redirect_to @massage, notice: 'Massage was successfully created.' }
        format.json { render action: 'show', status: :created, location: @massage }
      else
        format.html { render action: 'new' }
        format.json { render json: @massage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /massages/1
  # PATCH/PUT /massages/1.json
  def update
    respond_to do |format|
      if @massage.update(massage_params)
        format.html { redirect_to @massage, notice: 'Massage was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @massage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /massages/1
  # DELETE /massages/1.json
  def destroy
    @massage.destroy
    respond_to do |format|
      format.html { redirect_to massages_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_massage
      @massage = Massage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def massage_params
      params.require(:massage).permit(:title, :content, :user_id, :receiver_id)
    end
end
