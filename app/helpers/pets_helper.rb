module PetsHelper
  def display_pet_name(pet)
    if pet.name.blank?
      'Unknown'
    else
      pet.name
    end
  end
end
