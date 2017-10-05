class BadgesController < ApplicationController
  def index
    @badges = Badge.find_by featured: true
    render json: @badges
  end

  def all
    @badges = Badge.all
    render json: @badges
  end


end
