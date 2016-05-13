class VaccinesController < ApplicationController
  expose(:vaccines)
  expose(:vaccine)

  # POST /vaccines
  # POST /vaccines.json
  def create
    respond_to do |format|
      if vaccine.save
        format.html { redirect_to vaccine, notice: 'Vaccine was successfully created.' }
        format.json { render :show, status: :created, location: vaccine }
      else
        format.html { render :new }
        format.json { render json: vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vaccines/1
  # PATCH/PUT /vaccines/1.json
  def update
    respond_to do |format|
      if vaccine.update(vaccine_params)
        format.html { redirect_to vaccine, notice: 'Vaccine was successfully updated.' }
        format.json { render :show, status: :ok, location: vaccine }
      else
        format.html { render :edit }
        format.json { render json: vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vaccines/1
  # DELETE /vaccines/1.json
  def destroy
    vaccine.destroy
    respond_to do |format|
      format.html { redirect_to vaccines_url, notice: 'Vaccine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def vaccine_params
    params.require(:vaccine).permit(:name, :periodicity)
  end
end
