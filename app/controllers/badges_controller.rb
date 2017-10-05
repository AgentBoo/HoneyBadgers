class BadgesController < ApplicationController
  def index
    @badges = Badge.find_by(featured: true).order(:id)
    render json: @badges
  end

  def all
    @badges = Badge.all.order(:id)
    render json: @badges
  end


end
