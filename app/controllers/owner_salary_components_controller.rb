class OwnerSalaryComponentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_owner_salary_component, only: [:show, :edit, :update, :destroy]

  # GET /owner_salary_components
  # GET /owner_salary_components.json
  def index
    @owner_salary_components = OwnerSalaryComponent.all
  end

  # GET /owner_salary_components/1
  # GET /owner_salary_components/1.json
  def show
  end

  # GET /owner_salary_components/new
  def new
    @owner_salary_component = OwnerSalaryComponent.new
  end

  # GET /owner_salary_components/1/edit
  def edit
  end

  # POST /owner_salary_components
  # POST /owner_salary_components.json
  def create
    @owner_salary_component = OwnerSalaryComponent.new(owner_salary_component_params)

    respond_to do |format|
      if @owner_salary_component.save
        format.html { redirect_to @owner_salary_component, notice: 'Owner salary component was successfully created.' }
        format.json { render :show, status: :created, location: @owner_salary_component }
      else
        format.html { render :new }
        format.json { render json: @owner_salary_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /owner_salary_components/1
  # PATCH/PUT /owner_salary_components/1.json
  def update
    respond_to do |format|
      if @owner_salary_component.update(owner_salary_component_params)
        format.html { redirect_to @owner_salary_component, notice: 'Owner salary component was successfully updated.' }
        format.json { render :show, status: :ok, location: @owner_salary_component }
      else
        format.html { render :edit }
        format.json { render json: @owner_salary_component.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owner_salary_components/1
  # DELETE /owner_salary_components/1.json
  def destroy
    @owner_salary_component.destroy
    respond_to do |format|
      format.html { redirect_to owner_salary_components_url, notice: 'Owner salary component was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_owner_salary_component
      @owner_salary_component = OwnerSalaryComponent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def owner_salary_component_params
      params.require(:owner_salary_component).permit(:owner_salary, :owner_commission, :spouse_salary, :spouse_commission, :start_date, :end_date, :company_id)
    end
end
