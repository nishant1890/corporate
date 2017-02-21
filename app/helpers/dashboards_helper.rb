module DashboardsHelper

  def company_revenue(company)
    if @company.name == 'Elite Rehab Placement'
      if ['Monarch Shores', 'Willow Springs Recovery', 'Chapters Capistrano'].include?(company.name)
        0.25 * Revenue.revenue_for_a_month(company, params[:month].to_i, params[:year].to_i)
      else
        Revenue.revenue_for_a_month(company, params[:month].to_i, params[:year].to_i)
      end
    else
      Revenue.revenue_for_a_month(company, params[:month].to_i, params[:year].to_i)
    end
  end  
end
