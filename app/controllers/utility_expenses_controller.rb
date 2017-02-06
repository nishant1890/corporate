class UtilityExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_utility_expense, only: [:show, :edit, :update, :destroy]

  # GET /utility_expenses
  # GET /utility_expenses.json
  def index
    @utility_expenses = UtilityExpense.all
  end

  # GET /utility_expenses/1
  # GET /utility_expenses/1.json
  def show
  end

  # GET /utility_expenses/new
  def new
    @utility_expense = UtilityExpense.new
  end

  # GET /utility_expenses/1/edit
  def edit
  end

  # POST /utility_expenses
  # POST /utility_expenses.json
  def create
    @utility_expense = UtilityExpense.new(utility_expense_params)

    respond_to do |format|
      if @utility_expense.save
        format.html { redirect_to @utility_expense, notice: 'Utility expense was successfully created.' }
        format.json { render :show, status: :created, location: @utility_expense }
      else
        format.html { render :new }
        format.json { render json: @utility_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /utility_expenses/1
  # PATCH/PUT /utility_expenses/1.json
  def update
    respond_to do |format|
      if @utility_expense.update(utility_expense_params)
        format.html { redirect_to @utility_expense, notice: 'Utility expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @utility_expense }
      else
        format.html { render :edit }
        format.json { render json: @utility_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /utility_expenses/1
  # DELETE /utility_expenses/1.json
  def destroy
    @utility_expense.destroy
    respond_to do |format|
      format.html { redirect_to utility_expenses_url, notice: 'Utility expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_utility_expense
      @utility_expense = UtilityExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def utility_expense_params
      params.require(:utility_expense).permit(:cable, :gas, :electric, :water, :food, :yoga, :acupunture, :auto, :fuel, :landscaping, :cleaning, :total_per_house, :start_date, :end_date, :company_id)
    end
end
