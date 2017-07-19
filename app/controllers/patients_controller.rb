class PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /patients
  # GET /patients.json
  def index
    #@patients = Patient.all
    ##@patients = Patient.order("name").page(params['page']).per(20)

    @q = Patient.ransack(params[:q])
    @q.sorts = 'name' if @q.sorts.empty?
    ##@patients = @q.result.page(params['page']).per(10) #funciona bem
    @patients = @q.result.page(params['page']).per(10)

     ##search = Component.search(search_params)
      # make name the default sort column
      #@search.sorts = 'name' if @search.sorts.empty?
      #@component = @search.result().page(params[:page])

  end

  # GET /patients/1
  # GET /patients/1.json
  def show
  end

  # GET /patients/new
  def new
    @patient = Patient.new

    if params[:birth_date].present?
      @patient.birth_date = params[:birth_date]
    end

    #if params[:province_id].present?
  #    @patient.province_id = params[:province_id]
  #  end
  end

  # GET /patients/1/edit
  def edit
  end

  # POST /patients
  # POST /patients.json
  def create
    @patient = Patient.new(patient_params)

    respond_to do |format|
      if @patient.save
        format.html { redirect_to @patient, notice: t('create_success') }
        format.json { render :show, status: :created, location: @patient }
        #format.js { render :show, status: :created, location: @patient }
        format.js { }
      else
        format.html { render :new }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
        format.js { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patients/1
  # PATCH/PUT /patients/1.json
  def update
    respond_to do |format|
      if @patient.update(patient_params)
        format.html { redirect_to @patient, notice: t('update_success')
          @aniver = Patient.find(10787)
          BirthdayMailer.greetings_email(@aniver).deliver
         }
        format.json { render :show, status: :ok, location: @patient }
      else
        format.html { render :edit }
        format.json { render json: @patient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patients/1
  # DELETE /patients/1.json
  def destroy
    @patient.destroy
    respond_to do |format|
      format.html { redirect_to patients_url, notice: t('destroy_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient
      @patient = Patient.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def patient_params
      params.require(:patient).permit(:filial, :name, :cpf, :rg, :gender, :birth_date, :email, :address, :city, :province, :cep, :phone, :phone2, :occupation, :mothers_name, :fathers_name, :notes, :heighborhood)
    end
end
