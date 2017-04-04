class RequestersController < ApplicationController
  before_action :set_requester, only: [:show, :edit, :update, :destroy]

  # GET /requester
  # GET /requester.json
  def index
   ## @requesters = Requester.all

    ##@requesters = Requester.order("name").page(params['page']).per(20)

    @q = Requester.ransack(params[:q])
    @q.sorts = 'name' if @q.sorts.empty?
    @requesters = @q.result.page(params['page']).per(10)

  end

  # GET /requester/1
  # GET /requester/1.json
  def show
  end

  # GET /requester/new
  def new
    @requester = Requester.new
  end

  # GET /requester/1/edit
  def edit
  end

  # POST /requester
  # POST /requester.json
  def create
    @requester = Requester.new(requester_params)

    respond_to do |format|
      if @requester.save
        format.html { redirect_to @requester, notice: t('create_success') }
        format.json { render :show, status: :created, location: @requester }
      else
        format.html { render :new }
        format.json { render json: @requester.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /requester/1
  # PATCH/PUT /requester/1.json
  def update
    respond_to do |format|
      if @requester.update(requester_params)
        format.html { redirect_to @requester, notice: t('update_success') }
        format.json { render :show, status: :ok, location: @requester }
      else
        format.html { render :edit }
        format.json { render json: @requester.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /requester/1
  # DELETE /requester/1.json
  def destroy
    @requester.destroy
    respond_to do |format|
      format.html { redirect_to requesters_url, notice: t('destroy_success') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_requester
      @requester = Requester.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def requester_params
      params.require(:requester).permit(:name, :register, :email, :phone, :notes)
    end
end
