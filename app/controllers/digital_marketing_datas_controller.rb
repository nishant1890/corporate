class DigitalMarketingDatasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_digital_marketing_data, only: [:show, :edit, :update, :destroy]

  # GET /digital_marketing_datas
  # GET /digital_marketing_datas.json
  def index
    @digital_marketing_datas = DigitalMarketingData.all
  end

  # GET /digital_marketing_datas/1
  # GET /digital_marketing_datas/1.json
  def show
  end

  # GET /digital_marketing_datas/new
  def new
    @digital_marketing_data = DigitalMarketingData.new
  end

  # GET /digital_marketing_datas/1/edit
  def edit
  end

  # POST /digital_marketing_datas
  # POST /digital_marketing_datas.json
  def create
    @digital_marketing_data = DigitalMarketingData.new(digital_marketing_data_params)

    respond_to do |format|
      if @digital_marketing_data.save
        format.html { redirect_to digital_marketing_data_path(@digital_marketing_data), notice: 'DigitalMarketingData was successfully created.' }
        format.json { render :show, status: :created, location: @digital_marketing_data }
      else
        format.html { render :new }
        format.json { render json: @digital_marketing_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /digital_marketing_datas/1
  # PATCH/PUT /digital_marketing_datas/1.json
  def update
    respond_to do |format|
      if @digital_marketing_data.update(digital_marketing_data_params)
        format.html { redirect_to digital_marketing_data_path(@digital_marketing_data), notice: 'DigitalMarketingData was successfully updated.' }
        format.json { render :show, status: :ok, location: @digital_marketing_data }
      else
        format.html { render :edit }
        format.json { render json: @digital_marketing_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /digital_marketing_datas/1
  # DELETE /digital_marketing_datas/1.json
  def destroy
    @digital_marketing_data.destroy
    respond_to do |format|
      format.html { redirect_to digital_marketing_datas_url, notice: 'DigitalMarketingData was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_digital_marketing_data
      @digital_marketing_data = DigitalMarketingData.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def digital_marketing_data_params
      params.require(:digital_marketing_data).permit(:company_id, :date, :amount, :search_engine)
    end
end
