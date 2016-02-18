class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
    @pets = Pet.all
    authorize Pet
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = current_user.pets.build(pet_params)
    authorize @pet
    if @pet.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @pet = Pet.find(param[:id])
    authorize @pet
  end

  def update
    @pet.update(pet_params)
    authorize @pet
    redirect_to root_path
  end

  def delete
    Pet.find(params[:id]).destroy
    authorize @pet
    redirect_to root_path
  end

  private

  def pet_params
    params.require(:pet).permit(:species, :name, :sex, :colour, :identification, :location,
                                :description, :status, :photos)
  end

  def set_pet
    @pet = current_user.pets.find(params[:id])
  end
end
