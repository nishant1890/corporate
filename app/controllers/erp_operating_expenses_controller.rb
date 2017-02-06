class ErpOperatingExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_erp_operating_expense, only: [:show, :edit, :update, :destroy]

  # GET /erp_operating_expenses
  # GET /erp_operating_expenses.json
  def index
    @erp_operating_expenses = ErpOperatingExpense.all
  end

  # GET /erp_operating_expenses/1
  # GET /erp_operating_expenses/1.json
  def show
  end

  # GET /erp_operating_expenses/new
  def new
    @erp_operating_expense = ErpOperatingExpense.new
  end

  # GET /erp_operating_expenses/1/edit
  def edit
  end

  # POST /erp_operating_expenses
  # POST /erp_operating_expenses.json
  def create
    @erp_operating_expense = ErpOperatingExpense.new(erp_operating_expense_params)

    respond_to do |format|
      if @erp_operating_expense.save
        format.html { redirect_to @erp_operating_expense, notice: 'Erp operating expense was successfully created.' }
        format.json { render :show, status: :created, location: @erp_operating_expense }
      else
        format.html { render :new }
        format.json { render json: @erp_operating_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /erp_operating_expenses/1
  # PATCH/PUT /erp_operating_expenses/1.json
  def update
    respond_to do |format|
      if @erp_operating_expense.update(erp_operating_expense_params)
        format.html { redirect_to @erp_operating_expense, notice: 'Erp operating expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @erp_operating_expense }
      else
        format.html { render :edit }
        format.json { render json: @erp_operating_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /erp_operating_expenses/1
  # DELETE /erp_operating_expenses/1.json
  def destroy
    @erp_operating_expense.destroy
    respond_to do |format|
      format.html { redirect_to erp_operating_expenses_url, notice: 'Erp operating expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_erp_operating_expense
      @erp_operating_expense = ErpOperatingExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def erp_operating_expense_params
      params.require(:erp_operating_expense).permit(:paycheck, :insurance, :office, :utilities, :internet, :phone, :rt, :salesforce, :sf_admin, :sms_magic, :lindexed, :start_date, :end_date, :company_id)
    end
end
