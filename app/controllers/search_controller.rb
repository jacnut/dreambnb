class SearchController < ApplicationController

  before_action :set_search, only: [:index]

  def index
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Flat.find(params[:city])
    end

end