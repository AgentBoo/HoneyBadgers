class BadgesController < ApplicationController
  def index
    @badges = Badge.where(featured: true)
    render json: @badges
  end

  def all
    @badges = Badge.all.order(:id)
    render json: @badges
  end


end
