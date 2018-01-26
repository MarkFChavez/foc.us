class NotesController < ApplicationController
  def new
    @note = Note.new
  end

  def create
    result = Note::Operations::Create.(params[:note], {
      current_user: current_user,
      category_ids: params[:category_ids]
    })
    @note = result["model"]

    if result.success?
      redirect_to root_url
    else
      render :new
    end
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    result = Note::Operations::Update.({ description: params[:note][:description] }, {
      note_id: params[:id],
      current_user: current_user,
      category_ids: params[:category_ids]
    })
    @note = result["model"]

    if result.success?
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

end
