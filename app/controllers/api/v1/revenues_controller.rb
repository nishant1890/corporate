class Api::V1::RevenuesController < Api::V1::BaseController

  def create
    if params[:revenues].try(:values).present?
      create_status = params[:revenues].each_with_object({}) do |(index, object), h|
        company = Company.find_by(name: object[:company_name])
        
        if company.present?
          revenue = company.revenues.build(object)
          if revenue.save
            h[index] = {revenue: revenue.attributes}
          else
            h[index] = {error: "Failed to save the revenue", errors: formatted_error_messages(revenue)}
          end
        else
          h[index] = {error: "Failed to save the revenue", errors: {company: 'Invalid company'}}
        end
      end
      render json: create_status, status: 200
    else
      render json: {error: "Failed to save revenues", errors: {revenue: "Please send atleast one revenue object"}}
    end
  end

  private
  def revenue_params
    params.require(:revenue).permit(Revenue.attribute_names)
  end
end