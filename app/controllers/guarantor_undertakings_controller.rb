class GuarantorUndertakingsController < ApplicationController
  before_action :set_member
  before_action :set_loan_application
  before_action :set_guarantor_undertaking, only: %i[edit update show]

  def index
  	@q = Current.branch.guarantor_undertakings.ransack(params[:q])
    @guarantor_undertakings = @q.result(distinct: true)
  end

  def new
    @guarantor_undertaking = @loan_application.guarantor_undertakings.new(member: @member)
  end

  def create
    @guarantor_undertaking = @loan_application.guarantor_undertakings.new(guarantor_undertaking_params)
    @guarantor_undertaking.cooperative_branch_id = Current.branch.id
    @guarantor_undertaking.member_id = params["member_id"]

    if @guarantor_undertaking.save
      redirect_to member_loan_application_path(@member, @loan_application), notice: "Guarantor Undertaking was successfully created."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @guarantor_undertaking.update(guarantor_undertaking_params)
      redirect_to member_loan_application_path(@member, @loan_application), notice: "Guarantor Undertaking was successfully updated."
    else
      render :edit
    end
  end

  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "member_form_#{@member.id}",
               template: "guarantor_undertakings/show",
               layout: "pdf",
               margin: { top: 5, bottom: 5 }, 
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

  private

  def set_member
    @member = Member.find(params[:member_id]) unless params[:member_id].blank?
  end

  def set_loan_application
    @loan_application = @member.loan_applications.find(params[:loan_application_id]) unless params[:loan_application_id].blank?
  end

  def set_guarantor_undertaking
    @guarantor_undertaking = @loan_application.guarantor_undertakings.find(params[:id])
  end

  def guarantor_undertaking_params
    params.require(:guarantor_undertaking).permit(
      :member_id, :guarantor_id, :loan_application_id,
      :guarantee_date, :purpose_date
    )
  end
end
