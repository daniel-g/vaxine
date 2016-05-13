class PetVaccinesController < ApplicationController
  expose(:pet_vaccines)
  expose(:pet_vaccine, attributes: :pet_vaccine_params)

  # POST /pet_vaccines
  # POST /pet_vaccines.json
  def create
    respond_to do |format|
      if pet_vaccine.save
        format.html { redirect_to pet_vaccine, notice: 'Pet vaccine was successfully created.' }
        format.json { render :show, status: :created, location: pet_vaccine }
      else
        format.html { render :new }
        format.json { render json: pet_vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_vaccines/1
  # PATCH/PUT /pet_vaccines/1.json
  def update
    respond_to do |format|
      if pet_vaccine.update(pet_vaccine_params)
        format.html { redirect_to pet_vaccine, notice: 'Pet vaccine was successfully updated.' }
        format.json { render :show, status: :ok, location: pet_vaccine }
      else
        format.html { render :edit }
        format.json { render json: pet_vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_vaccines/1
  # DELETE /pet_vaccines/1.json
  def destroy
    pet_vaccine.destroy
    respond_to do |format|
      format.html { redirect_to pet_vaccines_url, notice: 'Pet vaccine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def pet_vaccine_params
    params.require(:pet_vaccine).permit(:pet_id, :vaccine_id, :apply_at)
  end
end
