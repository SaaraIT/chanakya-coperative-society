class AdditionalSharesApplicationsController < ApplicationController
  before_action :set_member

  def index
    @q = Current.branch.additional_shares_applications.ransack(params[:q])
    @additional_shares_applications = @q.result(distinct: true)
  end

  def new
    @application = @member.additional_shares_applications.new
  end

  def create
    @application = @member.additional_shares_applications.new(application_params)
    @application.cooperative_branch_id = Current.branch.id
    if @application.save
      redirect_to @member, notice: 'Application submitted successfully.'
    else
      render :new
    end
  end

  def show
  	@application = @member.additional_shares_applications.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "additional_shares_application_#{@application.id}",
               template: "additional_shares_applications/show",
               layout: "pdf",
                margin: { top: 10, bottom: 10 }, 
               show_as_html: params.key?('debug')
      end
    end
  end

  private

  def set_member
    @member = Member.find(params[:member_id]) unless params[:member_id].blank?
  end

  def application_params
    params.require(:additional_shares_application).permit(
      :additional_shares_required, :additional_share_capital_to_be_paid,
      :place, :application_date, :receipt_no, :office_date, :office_share_capital
    )
  end
end
