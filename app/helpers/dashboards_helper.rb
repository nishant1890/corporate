module DashboardsHelper

  def revenue_for_month(month)
    if @company.name == 'Elite Rehab Placement'
      @company.erp_revenue_for_month(month, params[:year])
    else
      Revenue.revenue_for_a_month(@company, month, params[:year]) 
    end
  end 
end
