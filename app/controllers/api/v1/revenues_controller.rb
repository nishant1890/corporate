class Api::V1::RevenuesController < Api::V1::BaseController

  def create
    company = Company.find_by(name: params["revenue"]["company_name"])
    
    if company.present?
      revenue = company.revenues.build(revenue_params)
      if revenue.save
        render json: {revenue: revenue.attributes}, status: 200
      else
        render json: {error: "Failed to save the revenue", errors: formatted_error_messages(revenue)}, status: 422
      end
    else
      render json: {error: "Failed to save the revenue", errors: {company: 'Invalid company'}}, status: 422
    end
  end

  private
  def revenue_params
    params.require(:revenue).permit(Revenue.attribute_names)
  end
end