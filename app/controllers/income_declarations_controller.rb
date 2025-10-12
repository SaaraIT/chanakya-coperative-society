class IncomeDeclarationsController < ApplicationController
  before_action :set_member
  before_action :set_income_declaration, only: [:edit, :update, :show]

  def index
    @q = Current.branch.income_declarations.ransack(params[:q])
    @income_declarations = @q.result(distinct: true)
  end

  def new
    @income_declaration = @member.build_income_declaration
  end

  def create
    @income_declaration = @member.build_income_declaration(income_declaration_params)
    @income_declaration.cooperative_branch_id = Current.branch.id
    if @income_declaration.save
      redirect_to @member, notice: 'Income declaration was successfully submitted.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @income_declaration.update(income_declaration_params)
      redirect_to @member, notice: 'Income declaration was successfully updated.'
    else
      render :edit
    end
  end

  def show
 
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "member_form_#{@member.id}",
               template: "income_declarations/show",
               layout: "pdf",
                margin: { top: 10, bottom: 10 }, 
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

  def set_income_declaration
    @income_declaration = @member.income_declaration
  end

  def income_declaration_params
    params.require(:income_declaration).permit(:occupation, :company_name, :years_of_experience, :income, :income_period, :amount_in_words, :declarant_name)
  end
end
