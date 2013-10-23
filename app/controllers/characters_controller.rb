class CharactersController < ApplicationController
  layout false

  def show
    @character = Character.find(params[:id])
  end

  def edit
    @character = Character.find(params[:id])
  end

end
