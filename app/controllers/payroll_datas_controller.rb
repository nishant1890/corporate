class PayrollDatasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_payroll_data, only: [:show, :edit, :update, :destroy]

  # GET /payroll_datas
  # GET /payroll_datas.json
  def index
    @payroll_datas = PayrollData.all
  end

  # GET /payroll_datas/1
  # GET /payroll_datas/1.json
  def show
  end

  # GET /payroll_datas/new
  def new
    @payroll_data = PayrollData.new
  end

  # GET /payroll_datas/1/edit
  def edit
  end

  # POST /payroll_datas
  # POST /payroll_datas.json
  def create
    @payroll_data = PayrollData.new(payroll_data_params)

    respond_to do |format|
      if @payroll_data.save
        format.html { redirect_to payroll_data_path(@payroll_data), notice: 'PayrollData was successfully created.' }
        format.json { render :show, status: :created, location: @payroll_data }
      else
        format.html { render :new }
        format.json { render json: @payroll_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payroll_datas/1
  # PATCH/PUT /payroll_datas/1.json
  def update
    respond_to do |format|
      if @payroll_data.update(payroll_data_params)
        format.html { redirect_to payroll_data_path(@payroll_data), notice: 'PayrollData was successfully updated.' }
        format.json { render :show, status: :ok, location: @payroll_data }
      else
        format.html { render :edit }
        format.json { render json: @payroll_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payroll_datas/1
  # DELETE /payroll_datas/1.json
  def destroy
    @payroll_data.destroy
    respond_to do |format|
      format.html { redirect_to payroll_datas_url, notice: 'PayrollData was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payroll_data
      @payroll_data = PayrollData.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payroll_data_params
      params.require(:payroll_data).permit(:company_id, :date, :amount, :payroll_type, :type)
    end
end
