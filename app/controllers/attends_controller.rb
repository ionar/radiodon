class AttendsController < ApplicationController
  before_action :set_attend, only: [:show, :edit, :update, :destroy, :export]
  load_and_authorize_resource

   # Nós incluimos aqui a lib que vamos criar chamada generate_pdf.rb
  require './lib/generate_pdf'

  def diasel
    #render text: "Action diasel"
    @attends = Attend.where(nil)
    #@attends = Attend.where("clinic_id = ?", current_user.clinic_id)
    #@attends = @attends.para_o_dia(params[:dia]) if params[:dia].present?
    ##if params[:dia].present?
    ##  @attends = @attends.para_a_clinica(current_user.clinic_id).para_o_dia(params[:dia])
    ## else
    ##  @attends = @attends.para_a_clinica(current_user.clinic_id).para_o_dia(Date.current)
    ##end

    @attends = @attends.para_a_clinica(current_user.clinic_id).para_o_dia(params[:dia])
    respond_to do |format|
      format.js
    end
  end

  # GET /attends
  # GET /attends.json
  def index
    @attend = Attend.new

    if params[:dia].present?
      @attend.schedule = params[:dia]
    else
      @attend.schedule = Date.current
    end

    @attends_todos = Attend.where(nil)
    @attends_todos = @attends_todos.para_a_clinica(current_user.clinic_id)

    @attends = Attend.where(nil)
    #@attends = @attends.para_a_clinica(current_user.clinic_id)
    @attends = @attends.para_a_clinica(current_user.clinic_id).para_o_dia(Date.current).order(appointment: :asc)
    #filtro, usa scope no model - desativado por enquanto
    #@attends = @attends.clinic(params[:clinic]) if params[:clinic].present?


  end

  # GET /attends/1
  # GET /attends/1.json
  def show
  end

  # GET /attends/new
  def new
    @attend = Attend.new

    if params[:dia].present?
      @attend.schedule = params[:dia]
    else
      @attend.schedule = Date.current
    end

    if params[:hora].present?
      @attend.appointment = params[:hora]
    end


    @attends_todos = Attend.where(nil)
    @attends_todos = @attends_todos.para_a_clinica(current_user.clinic_id)

    @attends = Attend.where(nil)
    @attends = @attends.para_a_clinica(current_user.clinic_id).para_o_dia(Date.current)
  end

  # GET /attends/1/edit
  def edit
  end

  # POST /attends
  # POST /attends.json
  def create
    @attend = Attend.new(attend_params)
    @attend.clinic_id = current_user.clinic_id

    #year_of_birth_date = @attend.patient.birth_date.strftime("%Y").to_i
    #year_of_today = Date.today.strftime("%Y").to_i
    #@attend.age = year_of_today - year_of_birth_date

    @attends_todos = Attend.where(nil)
    @attends_todos = @attends_todos.para_a_clinica(current_user.clinic_id)

    @attends = Attend.where(nil)
    @attends = @attends.para_a_clinica(current_user.clinic_id).para_o_dia(Date.current)


    respond_to do |format|
      if @attend.save
        format.html { redirect_to @attend, notice: t('create_success') }
        format.json { render :show, status: :created, location: @attend }
        #format.js   {render :show, status: :created, location: @attend }
      else
        format.html { render :new }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
        #format.js {render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attends/1
  # PATCH/PUT /attends/1.json
  def update

    if @attend.patient.present?
      year_of_birth_date = @attend.patient.birth_date.strftime("%Y").to_i
      year_of_today = Date.today.strftime("%Y").to_i
      @attend.age = year_of_today - year_of_birth_date
    end

    respond_to do |format|
      if @attend.update(attend_params)

        format.html { redirect_to @attend, notice: t('update_success') }
        format.json { render :show, status: :ok, location: @attend }
      else
        format.html { render :edit }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attends/1
  # DELETE /attends/1.json
  def destroy
    @attend.destroy
    respond_to do |format|
      format.html { redirect_to attends_url, notice: t('destroy_success') }
      format.json { head :no_content }
    end
  end

    # Criamos este método que vai chamar nossa lib para gerar o PDF e depois redirecionar o user para o arquivo PDF
  def export
    #pasta-folha, pasta-etiqueta, caixa-normal, caixa-economica
    modelo_etiqueta = params[:modelo]

    modelo = case modelo_etiqueta
    when "pasta-folha" then
      ##GeneratePdf::attend_pasta_folha(@attend.schedule, @attend.appointment, @attend.patient.name)
      GeneratePdf::attend_pasta_folha(@attend)
      redirect_to '/pasta-folha.pdf'
      puts "pasta-folha"
    when "pasta-etiqueta" then
      GeneratePdf::attend_pasta_etiqueta(@attend)
      redirect_to '/pasta-etiqueta.pdf'
      puts "pasta-etiqueta"
    when "caixa-normal" then
      GeneratePdf::attend_caixa_normal(@attend)
      redirect_to '/caixa-normal.pdf'
      puts "caixa-normal"
    when "caixa-economica" then
      GeneratePdf::attend_caixa_economica(@attend)
      redirect_to '/caixa-economica.pdf'
      puts "caixa-economica"
    end
  end

  def etiquetas
    @attends = Attend.all
    @attends = @attends.para_a_clinica(current_user.clinic_id).order(schedule: :desc)
  end

  def print
    @attends = Attend.where(nil)
    @teste = params[:attend]
    atendimentos_selecionados = @teste[:attend_ids]
    @attends_selected = @attends.quais(atendimentos_selecionados)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attend
      @attend = Attend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attend_params
      params.require(:attend).permit(:avatar, :clinic_id, :age, :patient_id, :schedule, :appointment, :requester_id, :notes, :discount, :total, :descriptive, :finalized, :missed, :exam_ids => [])
    end
end
