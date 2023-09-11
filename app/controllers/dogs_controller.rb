require 'net/http'

class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
  end

  def dog
    dog_breed = params[:dog_breed]
    dog_service = DogsService.new(ENV['DOGS_API_KEY'])
    dog_data = dog_service.fetch_dog_by_breed(dog_breed)

    if dog_data
      existing_dog = Dog.find_by(name: dog_data[0]['name'])

      if existing_dog
        redirect_to dog_path(existing_dog)
      else
        new_dog = dog_service.create_dog(dog_data[0].except("image_link"))

        if new_dog.valid?
          redirect_to dog_path(new_dog)
        else
          errors = new_dog.errors.full_messages
          render json: { error: "Error creating the new dog: #{errors.join(', ')}" }, status: :unprocessable_entity
        end
      end
    else
      render json: { error: "API request failed with status code: #{response.code}" }, status: :unprocessable_entity
    end
  end
end
