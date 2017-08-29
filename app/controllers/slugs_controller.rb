class SlugsController < ApplicationController

  def show
    normalize_user_input
    @slug = FriendlyId::Slug.find_by(slug: slug_params)
    if @slug
      render_view
    else
      raise ActiveRecord::RecordNotFound, notice: "This page does not exist"
    end
  end

  private
  attr_reader :slug_params

  def normalize_user_input
    # strips everything but letter, number, _ and -
    @slug_params ||= params[:id].gsub(/[^\w-]/, '')
  end

  def render_view
    case @slug.sluggable_type
    when "Flower"
      @flower = Flower.friendly.find(slug_params)
      render 'flowers/show'
    when "City"
      @city = City.friendly.find(slug_params)
      render 'cities/show'
    else raise ActiveRecord::RecordNotFound
    end
  end
end
