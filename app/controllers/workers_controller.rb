class WorkersController < ApplicationController
  def index
    @search = UserFields.search(params[:q])
    @workers = @search.result.includes(:user).workers.page(params[:page])
    @workers = @workers.tagged_with(params[:skills]) unless params[:skills].blank?
  end

  def show
    @worker = UserFields.find(params[:id])
  end
end
