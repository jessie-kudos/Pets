class PetsController < ApplicationController
  before_action :set_todo, only: [:edit, :update, :destroy]

  def home
  end

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = current_user.pets.build(pet_params)
    if @pet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(param[:id])
  end

  def update
    @pet.update(pet_params)
    redirect_to root_path
  end

  def delete
    Pet.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def pet_params
    params.require(:todo).permit(:species, :name, :sex, :colour, :identification, :location,
                                 :photo_file_name, :description, :status)
  end

  def set_pet
    @pet = current_user.todos.find(params[:id])
  end
end
