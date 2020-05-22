class VerificationController < ApplicationController
  def new
    @verification = Verification.new
  end

  def create
    @verification = Verification.new(verification_params)
    if @verification.save
      flash[:success] = "Verification image saved"
      redirect_back fallback_location: root_path
    end
  end

  def update
    @verification = User.find(params[:user_id]).verification
    if @verification.update_attributes(verification_params)
      flash[:success] = "Verification updated"
      redirect_back fallback_location: root_path
    end
  end

  private

  def verification_params
    params.require(:verification).permit(:name, :number, :image, :user_id)
  end
end
