class JewelLoanPromissoryNotesController < ApplicationController
  before_action :set_jewel_loan
  before_action :set_member
  before_action :set_promissory_note, only: [:show, :edit, :update, :destroy]

  def new
    @promissory_note = @jewel_loan.build_jewel_loan_promissory_note
  end

  def create
    @promissory_note = @jewel_loan.build_jewel_loan_promissory_note(jewel_loan_promissory_note_params)
    if @promissory_note.save
      redirect_to [@member, @jewel_loan], notice: "Promissory note was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @promissory_note.update(jewel_loan_promissory_note_params)
      redirect_to [@member, @jewel_loan], notice: "Promissory note was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @promissory_note.destroy
    redirect_to [@member, @jewel_loan], notice: "Promissory note was successfully deleted."
  end

  private

  def set_member
    @member = Member.find(params[:member_id]) unless params[:member_id].blank?
  end

  def set_jewel_loan
    @jewel_loan = JewelLoan.find(params[:jewel_loan_id])
  end

  def set_promissory_note
    @promissory_note = @jewel_loan.jewel_loan_promissory_note
  end

  def jewel_loan_promissory_note_params
    params.require(:jewel_loan_promissory_note).permit(
      :loan_number,
      :amount_in_words,
      :interest_rate,
      :promissory_date,
      :agreement_date,
      :repaid_on,
      :issued_on
    )
  end
end
