class JewelLoansController < ApplicationController
  before_action :set_member, only: %i[show edit new index create update]
  before_action :set_jewel_loan, only: %i[show edit update destroy]

  def index
    if(current_user.admin?)
      @q = JewelLoan.ransack(params[:q])
    else
      @q = Current.branch.jewel_loans.ransack(params[:q])
    end

    
    @jewel_loans = @q.result(distinct: true)
  end

  def new
    @jewel_loan =  JewelLoan.new
    
    if @member.blank?
      @member = @jewel_loan.build_member 
    else
      @jewel_loan.member = @member
    end

    10.times do
      item = @jewel_loan.jewel_items.build
    end
  end

  def create
    @jewel_loan = @member.jewel_loans.new(jewel_loan_params)
    @jewel_loan.cooperative_branch =  Current.branch
    if @jewel_loan.save
       redirect_to [@member, @jewel_loan], notice: 'Jewel Loan was successfully created.'
    else
       render :new
    end
  end

  def edit
    (10-@jewel_loan.jewel_items.count).times { @jewel_loan.jewel_items.build }
  end

  def update
    if @jewel_loan.update(jewel_loan_params)
      redirect_to [@member, @jewel_loan], notice: "Jewel Loan Application updated successfully."
    else
      render :edit
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "jewel_loan_form_#{@jewel_loan.id}",
               template: "jewel_loans/show",
               layout: "pdf",
               margin: { top: 8, bottom: 8 }, 
               footer: {
                  html: {
                    template: 'shared/pdf_header',
                    formats: [:html]
                  }
                },
               show_as_html: params.key?('debug')
      end
    end
  end

  def destroy
    @jewel_loan.destroy
    redirect_to @member, notice: "Loan Application deleted."
  end

  private

  def set_member
    @member = Member.find(params[:member_id]) if params["member_id"]
  end

  def set_jewel_loan
    @jewel_loan = JewelLoan.find(params[:id]) if params["id"]
  end

  def jewel_loan_params
    params.require(:jewel_loan).permit(
      :member_id, :loan_amount, :loan_duration, :sanction_amount, :loan_date, :loan_place,
      :nominee_name, :nominee_relation, :nominee_age, :nominee_aadhaar,
      jewel_items_attributes: [
        :id, :description, :gross_weight, :net_weight,
        jewel_appraisers_report_attributes: [:id, :rate_per_gram, :approximate_market_value]
      ]
    )
  end
end
