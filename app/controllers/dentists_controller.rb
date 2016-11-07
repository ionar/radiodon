class DentistsController < ApplicationController
  before_action :set_dentist, only: [:show, :edit, :update, :destroy]

  # GET /dentists
  # GET /dentists.json
  def index
    @dentists = Dentist.all
  end

  # GET /dentists/1
  # GET /dentists/1.json
  def show
  end

  # GET /dentists/new
  def new
    @dentist = Dentist.new
  end

  # GET /dentists/1/edit
  def edit
  end

  # POST /dentists
  # POST /dentists.json
  def create
    @dentist = Dentist.new(dentist_params)

    respond_to do |format|
      if @dentist.save
        format.html { redirect_to @dentist, notice: t('create_success') }
        format.json { render :show, status: :created, location: @dentist }
      else
        format.html { render :new }
        format.json { render json: @dentist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dentists/1
  # PATCH/PUT /dentists/1.json
  def update
    respond_to do |format|
      if @dentist.update(dentist_params)
        format.html { redirect_to @dentist, notice: t('update_success') }
        format.json { render :show, status: :ok, location: @dentist }
      else
        format.html { render :edit }
        format.json { render json: @dentist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dentists/1
  # DELETE /dentists/1.json
  def destroy
    @dentist.destroy
    respond_to do |format|
      format.html { redirect_to dentists_url, notice: t('destroy_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dentist
      @dentist = Dentist.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dentist_params
      params.require(:dentist).permit(:name, :register, :email, :phone, :notes)
    end
end
