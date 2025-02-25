class EntriesController < ApplicationController
  def new
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build
  end

  def create
    @place = Place.find(params[:place_id])
    @entry = @place.entries.build(entry_params)

    if @entry.save
      redirect_to place_path(@place), notice: "Entry added successfully!"
    else
      render :new
    end
  end

  private

  def entry_params
    params.require(:entry).permit(:title, :description, :date)
  end
end