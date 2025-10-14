class MembersController < ApplicationController
  before_action :set_member

  def index
    @q = Member.ransack(params[:q])
    @members = @q.result(distinct: true).page(params[:page]).per(5)

    respond_to do |format|
      format.html
    end
  end

  def new
    @member = Current.branch.members.new
    @member.memberships.build
  end

  # GET /members/1/edit
  def edit
  end

  # POST /members
  def create
    @member = Current.branch.members.new(member_params)
    @member.cooperative_branch_id = Current.branch.id

    Rails.logger.info "=== Member Validation Errors: #{@member.errors.full_messages} ===" unless @member.valid?

    if @member.save
      redirect_to @member, notice: 'Member was successfully created.'
    else
      Rails.logger.error "=== Failed to save member: #{@member.errors.full_messages} ==="
      @member.memberships.each_with_index do |membership, index|
        Rails.logger.error "=== Membership #{index} errors: #{membership.errors.full_messages} ===" if membership.errors.any?
      end
      flash.now[:alert] = "Please correct the errors below"
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /members/1
  def update
    if @member.update(member_params)
      redirect_to @member, notice: 'Member was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @membership = @member.memberships.last
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "member_form_#{@member.id}",
               template: "members/show",
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

  def search
    query = params[:q].to_s.strip.downcase
    loan_application = Current.branch.loan_applications.find(params[:loan])

    # Collect all member IDs to exclude: current member and co-applicants
    excluded_ids = [params[:member].to_i]
    excluded_ids += loan_application.co_applicants.pluck(:id) if loan_application.co_applicants.any?

    # Perform the search
    members = Member
      .where("LOWER(name) LIKE ?", "%#{query}%")
      .where.not(id: excluded_ids)
      .limit(10)

    render json: members.map { |m| 
      {
        id: m.id,
        name: m.name,
        mobile_number: m.mobile_number,
        address: m.address,
        father_name: m.father_or_husband_name,
        age: m.age,
        profession: m.profession,
        employer: m.employer,
        experience: m.work_experience
      } 
    }
  end


  # DELETE /members/1
  def destroy
    @member.destroy
    redirect_to members_url, notice: 'Member was successfully deleted.'
  end

  def co_applicant_form
    @member = Member.find(params[:id])
    if @member.income_and_expenditures.blank?
       @member.income_and_expenditures.build(source: "Salary")
       @member.income_and_expenditures.build(source: "Profession")
       @member.income_and_expenditures.build(source: "Business")
       @member.income_and_expenditures.build(source: "Other")
    end
 
    @coapp = LoanApplicationCoApplicant.new(member: @member)
    render partial: 'loan_applications/co_applicant_fields', locals: { member: @member, coapp: @coapp}
  end

  private

  # Set @member for actions that require it
  def set_member
    #if(current_user.admin?)
      @member = Member.find(params["id"]) unless params["id"].blank?
    #else
      #@member = Member.where(id: params["id"]).where(cooperative_branch_id: Current.branch.id).last unless params["id"].blank?
    #end
  end

  # Strong params to allow nested attributes for memberships
  def member_params
    params.require(:member).permit(
      :name, :father_or_husband_name, :father_or_husband, :mobile_number, :aadhaar_number, :voter_id, :pan_card, :driving_license, :age, :education, :occupation, :religion, :caste_category,:address_a_building, :address_b_building, :address_a_village, :address_b_village, :address_a_district, :address_b_district, :address_a_pincode, :address_b_pincode, :member_no, :religion_other, :profile_picture, :aadhar_card,
      memberships_attributes: [
        :id, :number_of_shares, :amount, :nominee_name, :nominee_address, :nominee_relationship, :other_particulars, :place, :signed_date, :nominee_phone,  :md_sign_place, :md_signed_date,:resolution_no, :resolution_date,
        :_destroy
      ]
    )
  end
end
 
