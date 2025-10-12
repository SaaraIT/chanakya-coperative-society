class ShgPersonalAgreementsController < ApplicationController
  before_action :set_shg_loan_application
  before_action :set_shg
  before_action :set_shg_personal_agreement, only: %i[show edit update destroy]

  def index
    @shg_personal_agreements = @shg_loan_application.shg_personal_agreements
  end

   def show
    @shg_personal_agreement = @shg_loan_application.shg_personal_agreements.find(params[:id])
    @loan_applicant = @shg_personal_agreement.shg_loan_applicant
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "loan_application_form_#{@shg_personal_agreement.id}",
               template: "shg_personal_agreements/show",
               layout: "pdf",
               margin: { top: 10, bottom: 10 }, 
               page_size: "A4",
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

  def new
    @shg_personal_agreement = @shg_loan_application.shg_personal_agreements.new

    if params[:a].present?
      @loan_applicant = @shg_loan_application.shg_loan_applicants.find(params[:a])
      @member = @loan_applicant.shg_member

      # Get all SHG members in the same group except the applicant
      @guarantor_options = @shg_loan_application.cooperative_branch.members
    else
      @guarantor_options = []
    end
  end


  def create
    @shg_personal_agreement = @shg_loan_application.shg_personal_agreements.new(shg_personal_agreement_params)
    @loan_applicant = @shg_loan_application.shg_loan_applicants.find(params[:shg_personal_agreement][:shg_loan_applicant_id])
    if @shg_personal_agreement.save
      unless params[:guarantor_income].blank?
        member = @shg_personal_agreement.guarantor
        member.income_amount = params[:guarantor_income]
        member.save
      end

      redirect_to @shg_loan_application, notice: "Personal Agreement created successfully."
    else
      @member = @loan_applicant.shg_member

      # Get all SHG members in the same group except the applicant
      @guarantor_options = @shg_loan_application.cooperative_branch.members
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  	@loan_applicant = @shg_personal_agreement.shg_loan_applicant
  	@member = @loan_applicant.shg_member

    # Get all SHG members in the same group except the applicant
    @guarantor_options = @shg_loan_application.cooperative_branch.members
  end

  def update
    if @shg_personal_agreement.update(shg_personal_agreement_params)
      unless params[:guarantor_income].blank?
        member = @shg_personal_agreement.guarantor
        member.income_amount = params[:guarantor_income]
        member.save
      end
      redirect_to @shg_loan_application, notice: "Personal Agreement updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @shg_personal_agreement.destroy
    redirect_to shg_loan_application_shg_personal_agreements_path(@shg_loan_application), notice: "Deleted successfully."
  end

  private

  def set_shg

  end

  def set_shg_loan_application
    @shg_loan_application = ShgLoanApplication.find(params[:shg_loan_application_id])
    @self_help_group = @shg_loan_application.self_help_group
  end

  def set_shg_personal_agreement
    @shg_personal_agreement = @shg_loan_application.shg_personal_agreements.find(params[:id])
    @loan_applicant = @shg_personal_agreement.shg_loan_applicant
    @member = @loan_applicant.shg_member
  end

  def shg_personal_agreement_params
    params.require(:shg_personal_agreement).permit(
      :shg_loan_applicant_id,
      :membership_no, :loan_purpose, :occupation, :income,
      :guarantor_id, :signed_date, :signed_place
    )
  end
end
