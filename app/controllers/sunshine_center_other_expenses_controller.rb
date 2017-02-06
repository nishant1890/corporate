class SunshineCenterOtherExpensesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sunshine_center_other_expense, only: [:show, :edit, :update, :destroy]

  # GET /sunshine_center_other_expenses
  # GET /sunshine_center_other_expenses.json
  def index
    @sunshine_center_other_expenses = SunshineCenterOtherExpense.all
  end

  # GET /sunshine_center_other_expenses/1
  # GET /sunshine_center_other_expenses/1.json
  def show
  end

  # GET /sunshine_center_other_expenses/new
  def new
    @sunshine_center_other_expense = SunshineCenterOtherExpense.new
  end

  # GET /sunshine_center_other_expenses/1/edit
  def edit
  end

  # POST /sunshine_center_other_expenses
  # POST /sunshine_center_other_expenses.json
  def create
    @sunshine_center_other_expense = SunshineCenterOtherExpense.new(sunshine_center_other_expense_params)

    respond_to do |format|
      if @sunshine_center_other_expense.save
        format.html { redirect_to @sunshine_center_other_expense, notice: 'Sunshine center other expense was successfully created.' }
        format.json { render :show, status: :created, location: @sunshine_center_other_expense }
      else
        format.html { render :new }
        format.json { render json: @sunshine_center_other_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sunshine_center_other_expenses/1
  # PATCH/PUT /sunshine_center_other_expenses/1.json
  def update
    respond_to do |format|
      if @sunshine_center_other_expense.update(sunshine_center_other_expense_params)
        format.html { redirect_to @sunshine_center_other_expense, notice: 'Sunshine center other expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @sunshine_center_other_expense }
      else
        format.html { render :edit }
        format.json { render json: @sunshine_center_other_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sunshine_center_other_expenses/1
  # DELETE /sunshine_center_other_expenses/1.json
  def destroy
    @sunshine_center_other_expense.destroy
    respond_to do |format|
      format.html { redirect_to sunshine_center_other_expenses_url, notice: 'Sunshine center other expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sunshine_center_other_expense
      @sunshine_center_other_expense = SunshineCenterOtherExpense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sunshine_center_other_expense_params
      params.require(:sunshine_center_other_expense).permit(:hosting, :blogging, :facebook, :liability_insurance, :heath_insurance, :detox, :workers_compensation, :fica, :office_supplies, :cort, :kipu, :miscellaneous, :start_date, :end_date, :company_id)
    end
end
