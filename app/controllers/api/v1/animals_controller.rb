class Api::V1::AnimalsController < ApplicationController
  before_action :find_animal, only: [:show, :update]
  def index
    @animals = Animal.all
    render json: @animals
  end

  def show
    render json: @animal
  end

  def update
    @animal.update(animal_params)
    if @animal.save
      render json: @animal, status: :accepted
    else
      render json: { errors: @animal.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save

      render json: @animal, status: :accepted
    else
      render json: { errors: @animal.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def animal_params
    params.permit(:user_id, :name, :type, :hunger, :hygiene, :active, :energy, :happy)
  end

  def find_animal
    @animal = Animal.find(params[:id])
  end
end
