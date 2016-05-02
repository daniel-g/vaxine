class PetVaccinesController < ApplicationController
  before_action :set_pet_vaccine, only: [:show, :edit, :update, :destroy]

  # GET /pet_vaccines
  # GET /pet_vaccines.json
  def index
    @pet_vaccines = PetVaccine.all
  end

  # GET /pet_vaccines/1
  # GET /pet_vaccines/1.json
  def show
  end

  # GET /pet_vaccines/new
  def new
    @pet_vaccine = PetVaccine.new
  end

  # GET /pet_vaccines/1/edit
  def edit
  end

  # POST /pet_vaccines
  # POST /pet_vaccines.json
  def create
    @pet_vaccine = PetVaccine.new(pet_vaccine_params)

    respond_to do |format|
      if @pet_vaccine.save
        format.html { redirect_to @pet_vaccine, notice: 'Pet vaccine was successfully created.' }
        format.json { render :show, status: :created, location: @pet_vaccine }
      else
        format.html { render :new }
        format.json { render json: @pet_vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pet_vaccines/1
  # PATCH/PUT /pet_vaccines/1.json
  def update
    respond_to do |format|
      if @pet_vaccine.update(pet_vaccine_params)
        format.html { redirect_to @pet_vaccine, notice: 'Pet vaccine was successfully updated.' }
        format.json { render :show, status: :ok, location: @pet_vaccine }
      else
        format.html { render :edit }
        format.json { render json: @pet_vaccine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pet_vaccines/1
  # DELETE /pet_vaccines/1.json
  def destroy
    @pet_vaccine.destroy
    respond_to do |format|
      format.html { redirect_to pet_vaccines_url, notice: 'Pet vaccine was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet_vaccine
      @pet_vaccine = PetVaccine.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pet_vaccine_params
      params.require(:pet_vaccine).permit(:pet_id, :vaccine_id, :apply_at)
    end
end
