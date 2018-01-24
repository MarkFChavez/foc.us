class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      item_categories = Array(params[:category_ids]).reject(&:empty?).inject([]) do |collection, id|
        collection << ItemCategory.new(subject: @note, category_id: id)
      end
      @note.item_categories = item_categories

      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.find(params[:id])

    if @note.update_attributes(note_params)
      item_categories = Array(params[:category_ids]).reject(&:empty?).inject([]) do |collection, id|
        collection << ItemCategory.new(subject: @note, category_id: id)
      end
      @note.item_categories = item_categories

      redirect_to root_url
    else
      render :edit
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
