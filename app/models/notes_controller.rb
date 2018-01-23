class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to root_url
    else
      render :new
    end
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy

    redirect_to root_url
  end

  private

    def note_params
      params.require(:note).permit(:description)
    end
end
