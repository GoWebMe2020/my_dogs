require 'net/http'

class DogsController < ApplicationController
  def show
    @dog = Dog.find(params[:id])
  end

  def dog_list
    @dog_data = session[:dog_data]
  end

  def dog
    dog_breed = params[:dog_breed]
    dog_service = DogsService.new(ENV['DOGS_API_KEY'])
    dog_data = dog_service.fetch_dog_by_breed(dog_breed)

    if dog_data.nil?
      handle_api_error("API request failed with status code: #{response.code}")
      return
    end

    if dog_data.length > 1
      store_dog_data_in_session(dog_data)
      return redirect_to('/dog_list')
    end

    handle_dog_data(dog_data[0])
  end

  def store_and_show_dog
    dog_data_json = params[:dog_data].to_json
    dog_data = JSON.parse(dog_data_json)

    handle_dog_data(dog_data)
  end

  private

  def store_dog_data_in_session(data)
    session[:dog_data] = data
  end

  def handle_dog_data(dog_info)
    existing_dog = Dog.find_by(name: dog_info['name'])

    if existing_dog
      redirect_to dog_path(existing_dog)
    else
      create_and_redirect_dog(dog_info)
    end
  end

  def create_and_redirect_dog(dog_info)
    dog_service = DogsService.new(ENV['DOGS_API_KEY'])
    new_dog = dog_service.create_dog(dog_info)

    if new_dog.valid?
      redirect_to dog_path(new_dog)
    else
      handle_dog_creation_error(new_dog)
    end
  end

  def handle_dog_creation_error(new_dog)
    errors = new_dog.errors.full_messages
    render json: { error: "Error creating the new dog: #{errors.join(', ')}" }, status: :unprocessable_entity
  end

  def handle_api_error(message)
    render json: { error: message }, status: :unprocessable_entity
  end
end
