class MarketingFixedExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_marketing_fixed_expense, only: [:show, :edit, :update, :destroy]

  # GET /marketing_fixed_expenses
  # GET /marketing_fixed_expenses.json
  def index
    @marketing_fixed_expenses = MarketingFixedExpense.all
  end

  # GET /marketing_fixed_expenses/1
  # GET /marketing_fixed_expenses/1.json
  def show
  end

  # GET /marketing_fixed_expenses/new
  def new
    @marketing_fixed_expense = MarketingFixedExpense.new
  end

  # GET /marketing_fixed_expenses/1/edit
  def edit
  end

  # POST /marketing_fixed_expenses
  # POST /marketing_fixed_expenses.json
  def create
    @marketing_fixed_expense = MarketingFixedExpense.new(marketing_fixed_expense_params)

    respond_to do |format|
      if @marketing_fixed_expense.save
        format.html { redirect_to @marketing_fixed_expense, notice: 'Marketing fixed expense was successfully created.' }
        format.json { render :show, status: :created, location: @marketing_fixed_expense }
      else
        format.html { render :new }
        format.json { render json: @marketing_fixed_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /marketing_fixed_expenses/1
  # PATCH/PUT /marketing_fixed_expenses/1.json
  def update
    respond_to do |format|
      if @marketing_fixed_expense.update(marketing_fixed_expense_params)
        format.html { redirect_to @marketing_fixed_expense, notice: 'Marketing fixed expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @marketing_fixed_expense }
      else
        format.html { render :edit }
        format.json { render json: @marketing_fixed_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /marketing_fixed_expenses/1
  # DELETE /marketing_fixed_expenses/1.json
  def destroy
    @marketing_fixed_expense.destroy
    respond_to do |format|
      format.html { redirect_to marketing_fixed_expenses_url, notice: 'Marketing fixed expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_marketing_fixed_expense
      @marketing_fixed_expense = MarketingFixedExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def marketing_fixed_expense_params
      params.require(:marketing_fixed_expense).permit(:southwest, :west_coast, :midwest, :new_england, :south_east, :sober_recover, :easy_breeze, :addiction_advisor, :visible, :air_time, :rehabs_hq, :drug_use_today, :facebook, :start_date, :end_date, :company_id)
    end
end
