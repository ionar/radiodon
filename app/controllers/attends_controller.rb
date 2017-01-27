class AttendsController < ApplicationController
  before_action :set_attend, only: [:show, :edit, :update, :destroy]

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
    @attends = @attends.para_a_clinica(current_user.clinic_id).para_o_dia(Date.current)
    #filtro, usa scope no model - desativado por enquanto
    #@attends = @attends.clinic(params[:clinic]) if params[:clinic].present?

    #@dia_selecionado = params[:dia]

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

    @attends_todos = Attend.where(nil)
    @attends_todos = @attends_todos.para_a_clinica(current_user.clinic_id)

    @attends = Attend.where(nil)
    @attends = @attends.para_a_clinica(current_user.clinic_id).para_o_dia(Date.current)


    respond_to do |format|
      if @attend.save
        format.html { redirect_to @attend, notice: t('create_success') }
        format.json { render :show, status: :created, location: @attend }
      else
        format.html { render :new }
        format.json { render json: @attend.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /attends/1
  # PATCH/PUT /attends/1.json
  def update
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attend
      @attend = Attend.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def attend_params
      params.require(:attend).permit(:clinic_id, :patient_id, :schedule, :appointment, :dentist_id, :notes, :discount, :total, :payment_detail, :finalized, :missed, :exam_ids => [])
    end
end
