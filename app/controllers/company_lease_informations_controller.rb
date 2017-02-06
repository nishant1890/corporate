class CompanyLeaseInformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company_lease_information, only: [:show, :edit, :update, :destroy]

  # GET /company_lease_informations
  # GET /company_lease_informations.json
  def index
    @company_lease_informations = CompanyLeaseInformation.all
  end

  # GET /company_lease_informations/1
  # GET /company_lease_informations/1.json
  def show
  end

  # GET /company_lease_informations/new
  def new
    @company_lease_information = CompanyLeaseInformation.new
  end

  # GET /company_lease_informations/1/edit
  def edit
  end

  # POST /company_lease_informations
  # POST /company_lease_informations.json
  def create
    @company_lease_information = CompanyLeaseInformation.new(company_lease_information_params)

    respond_to do |format|
      if @company_lease_information.save
        format.html { redirect_to @company_lease_information, notice: 'Company lease information was successfully created.' }
        format.json { render :show, status: :created, location: @company_lease_information }
      else
        format.html { render :new }
        format.json { render json: @company_lease_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /company_lease_informations/1
  # PATCH/PUT /company_lease_informations/1.json
  def update
    respond_to do |format|
      if @company_lease_information.update(company_lease_information_params)
        format.html { redirect_to @company_lease_information, notice: 'Company lease information was successfully updated.' }
        format.json { render :show, status: :ok, location: @company_lease_information }
      else
        format.html { render :edit }
        format.json { render json: @company_lease_information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /company_lease_informations/1
  # DELETE /company_lease_informations/1.json
  def destroy
    @company_lease_information.destroy
    respond_to do |format|
      format.html { redirect_to company_lease_informations_url, notice: 'Company lease information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_lease_information
      @company_lease_information = CompanyLeaseInformation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_lease_information_params
      params.require(:company_lease_information).permit(:house_id, :start_date, :end_date, :total_lease_amount, :company_id)
    end
end
