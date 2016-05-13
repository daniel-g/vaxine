class NotesController < ApplicationController
  expose(:notes)
  expose(:note, attributes: :note_params)

  # POST /notes
  # POST /notes.json
  def create
    respond_to do |format|
      if note.save
        format.html { redirect_to note, notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: note }
      else
        format.html { render :new }
        format.json { render json: note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if note.update(note_params)
        format.html { redirect_to note, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: note }
      else
        format.html { render :edit }
        format.json { render json: note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    note.destroy
    respond_to do |format|
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def note_params
    params.require(:note).permit(:text, :reviewed_at)
  end
end
