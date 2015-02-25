class SearchController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @results = Flat.where(city: params[:city])
  end

end