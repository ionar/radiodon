class ClinicsController < ApplicationController
  before_action :set_clinic, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource


  # GET /clinics
  # GET /clinics.json
  def index
    @clinics = Clinic.all

  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show

  end

  # GET /clinics/new
  def new
    @clinic = Clinic.new

  end

  # GET /clinics/1/edit
  def edit

  end

  # POST /clinics
  # POST /clinics.json
  def create

    @clinic = Clinic.new(clinic_params)

    respond_to do |format|
      if @clinic.save
        format.html { redirect_to @clinic, notice: t('create_success') }
        format.json { render :show, status: :created, location: @clinic }
      else
        format.html { render :new }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clinics/1
  # PATCH/PUT /clinics/1.json
  def update

    respond_to do |format|
      if @clinic.update(clinic_params)
        format.html { redirect_to @clinic, notice: t('update_success') }
        format.json { render :show, status: :ok, location: @clinic }
      else
        format.html { render :edit }
        format.json { render json: @clinic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    @clinic.destroy
    respond_to do |format|
      format.html { redirect_to clinics_url, notice: t('destroy_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clinic
      @clinic = Clinic.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def clinic_params
      params.require(:clinic).permit(:phone, :fantasy_name, :corporate_name, :cnpj, :technical_manager, :address, :cep, :city, :province_id)
    end
end
