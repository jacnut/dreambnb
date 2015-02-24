class SearchController < ApplicationController

  def index
    @results = Flat.where(city: params[:city])
  end

end