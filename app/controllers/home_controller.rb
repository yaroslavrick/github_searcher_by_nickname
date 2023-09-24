# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    return unless request.get? && search_params[:name].present?

    result = Home::Index::Organizer.call(name: search_params[:name])

    if result.success?
      @github_name = result.user_name
      @github_repos = result.user_repos
      @pagy, @github_repos = pagy_array(@github_repos)
    else
      handle_error(result)
    end
  end

  private

  def search_params
    params.permit(:name)
  end

  def handle_error(result)
    flash.now[:alert] = result.errors
    render :index, status: result.semantic_status || 400
  end
end
