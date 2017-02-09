class MiscellaneousExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_miscellaneous_expense, only: [:show, :edit, :update, :destroy]

  # GET /miscellaneous_expenses
  # GET /miscellaneous_expenses.json
  def index
    @miscellaneous_expenses = MiscellaneousExpense.all
  end

  # GET /miscellaneous_expenses/1
  # GET /miscellaneous_expenses/1.json
  def show
  end

  # GET /miscellaneous_expenses/new
  def new
    @miscellaneous_expense = MiscellaneousExpense.new
  end

  # GET /miscellaneous_expenses/1/edit
  def edit
  end

  # POST /miscellaneous_expenses
  # POST /miscellaneous_expenses.json
  def create
    @miscellaneous_expense = MiscellaneousExpense.new(miscellaneous_expense_params)

    respond_to do |format|
      if @miscellaneous_expense.save
        format.html { redirect_to miscellaneous_expense_url(@miscellaneous_expense), notice: 'MiscellaneousExpense was successfully created.' }
        format.json { render :show, status: :created, location: @miscellaneous_expense }
      else
        format.html { render :new }
        format.json { render json: @miscellaneous_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /miscellaneous_expenses/1
  # PATCH/PUT /miscellaneous_expenses/1.json
  def update
    respond_to do |format|
      if @miscellaneous_expense.update(miscellaneous_expense_params)
        format.html { redirect_to miscellaneous_expense_url(@miscellaneous_expense), notice: 'MiscellaneousExpense was successfully updated.' }
        format.json { render :show, status: :ok, location: @miscellaneous_expense }
      else
        format.html { render :edit }
        format.json { render json: @miscellaneous_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /miscellaneous_expenses/1
  # DELETE /miscellaneous_expenses/1.json
  def destroy
    @miscellaneous_expense.destroy
    respond_to do |format|
      format.html { redirect_to miscellaneous_expenses_url, notice: 'MiscellaneousExpense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_miscellaneous_expense
      @miscellaneous_expense = MiscellaneousExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def miscellaneous_expense_params
      params.require(:miscellaneous_expense).permit(:miscellaneous_expense_type, :month, :year, :company_id)
    end
end
