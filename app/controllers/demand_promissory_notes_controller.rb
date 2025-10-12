class DemandPromissoryNotesController < ApplicationController
  before_action :set_loan_application
  before_action :set_member
  before_action :set_demand_promissory_note, only: [:show, :edit, :update, :destroy]


  def index
    @q = Current.branch.demand_promissory_notes.ransack(params[:q])
    @demand_promissory_notes = @q.result(distinct: true)
  end

  def show
    @member = Member.find(params[:id])
    
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "member_form_#{@member.id}",
               template: "demand_promissory_notes/show",
               layout: "pdf",
               margin: { top: 5, bottom: 5 }, 
               footer: {
                  html: {
                    template: 'shared/pdf_header',
                    formats: [:html]
                  }
                },
                enable_local_file_access: true,
               show_as_html: params.key?('debug')
      end
    end
  end

  def new
    @demand_promissory_note = @member.demand_promissory_notes.new
  end

  def create
    @demand_promissory_note = @loan_application.demand_promissory_notes.new(demand_promissory_note_params)
    @demand_promissory_note.cooperative_branch_id = Current.branch.id
    @demand_promissory_note.member_id = params["member_id"]

    if @demand_promissory_note.save
      redirect_to member_loan_application_path(@member, @loan_application), notice: "Demand Promissory Note created successfully."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @demand_promissory_note.update(demand_promissory_note_params)
      redirect_to member_loan_application_path(@member, @loan_application), notice: "Demand Promissory Note updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @demand_promissory_note.destroy
    redirect_to loan_application_path(@loan_application), notice: "Demand Promissory Note deleted successfully."
  end

  private

  def set_member
    @member = @loan_application.try(:member)
  end

  def set_demand_promissory_note
    @demand_promissory_note = @loan_application.demand_promissory_notes.find(params[:id])
  end

  def set_loan_application
    @loan_application = Current.branch.loan_applications.find(params["loan_application_id"]) unless params["loan_application_id"].blank?
  end
  
  def demand_promissory_note_params
    params.require(:demand_promissory_note).permit(:branch, :loan_no, :amount, :date, :borrower_name, :surety1_name, :surety2_name, :interest_rate, :penal_rate, :witness1, :witness2, :sum, :sum_in_words)
  end
end
