class JewelAppraisersReportsController < ApplicationController
  before_action :set_member
  before_action :set_jewel_loan
  

  def new
    @jewel_appraisers_report = @jewel_loan.build_jewel_appraisers_report

    @jewel_loan.jewel_items.each do |item|
      @jewel_appraisers_report.jewel_item_reports.build(jewel_item: item)
    end
  end

  def create
    @jewel_appraisers_report = @jewel_loan.build_jewel_appraisers_report(jewel_appraisers_report_params)

    if @jewel_appraisers_report.save
      redirect_to [@member, @jewel_loan], notice: "Appraiser's Report was successfully created."
    else
      @jewel_loan.jewel_items.each do |item|
        unless @jewel_appraisers_report.jewel_item_reports.any? { |r| r.jewel_item_id == item.id }
          @jewel_appraisers_report.jewel_item_reports.build(jewel_item: item)
        end
      end
      render :new
    end
  end

  def edit
    @jewel_appraisers_report = @jewel_loan.jewel_appraisers_report
  end
 

  def update
    @jewel_appraisers_report = @jewel_loan.jewel_appraisers_report
    if @jewel_appraisers_report.update(jewel_appraisers_report_params)
      redirect_to [@member, @jewel_loan], notice: "Jewel Loan Appraiser's report updated successfully."
    else
      render :edit
    end
  end

  private

  def set_member
    @member = Member.find(params[:member_id]) unless params[:member_id].blank?
  end

  def set_jewel_loan
    @jewel_loan = JewelLoan.find(params[:jewel_loan_id])
  end

  def jewel_appraisers_report_params
    params.require(:jewel_appraisers_report).permit(
      :loan_number,
      :approved_value,
      jewel_item_reports_attributes: [
        :id, :jewel_item_id, :gross_weight, :net_weight,
        :rate_per_gram, :approx_market_value, :_destroy
      ]
    )
  end
end
