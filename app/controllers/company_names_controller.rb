class CompanyNamesController < ApplicationController
  before_action :set_company_name, only: [:show, :edit, :update, :destroy]

  # GET /company_names
  # GET /company_names.json
  def index
    @company_names = CompanyName.all
  end

  # GET /company_names/1
  # GET /company_names/1.json
  def show
  end

  # GET /company_names/new
  def new
    @company_name = CompanyName.new
  end

  # GET /company_names/1/edit
  def edit
  end

  # POST /company_names
  # POST /company_names.json
  def create
    @company_name = CompanyName.new(company_name_params)

    respond_to do |format|
      if @company_name.save
        format.html { redirect_to @company_name, notice: 'Company name was successfully created.' }
        format.json { render :show, status: :created, location: @company_name }
      else
        format.html { render :new }
        format.json { render json: @company_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_names/1
  # PATCH/PUT /company_names/1.json
  def update
    respond_to do |format|
      if @company_name.update(company_name_params)
        format.html { redirect_to @company_name, notice: 'Company name was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_name }
      else
        format.html { render :edit }
        format.json { render json: @company_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_names/1
  # DELETE /company_names/1.json
  def destroy
    @company_name.destroy
    respond_to do |format|
      format.html { redirect_to company_names_url, notice: 'Company name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_name
      @company_name = CompanyName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_name_params
      params.require(:company_name).permit(:date, :amount, :payroll_type, :search_engine, :month, :year, :miscellaneous_expense_type, :company_id)
    end
end
