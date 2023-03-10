class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    # @places = Place.search_by_name_and_details(params[:query])
    # @user = current_user
  end
end
