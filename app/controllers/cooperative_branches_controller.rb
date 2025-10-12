class CooperativeBranchesController < ApplicationController
  def edit
    @cooperative_branch = CooperativeBranch.find(params[:id])
  end

  def update
    @cooperative_branch = CooperativeBranch.find(params[:id])
    if @cooperative_branch.update(cooperative_branch_params)
      redirect_to cooperative_branch_path(@cooperative_branch), notice: "Branch updated successfully."
    else
      render :edit
    end
  end

  private

  def cooperative_branch_params
    params.require(:cooperative_branch).permit(:name, :cooperative_bank_id, :english_address, :kannada_address, :r_no, :phone_no, :manager_address, :manager_name)
  end

end
