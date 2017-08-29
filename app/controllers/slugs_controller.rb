class SlugsController < ApplicationController

  def show
    @slug = FriendlyId::Slug.find_by(slug: slug_params)
    if @slug
      render_view
    else
      raise ActiveRecord::RecordNotFound, notice: "This page does not exist"
    end
  end

  private
  attr_reader :slug_params

  def slug_params
    @slug_params ||= params[:id]
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
