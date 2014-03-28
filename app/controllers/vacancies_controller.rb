class VacanciesController < ApplicationController

  before_action :build_vacancy, only: :create
  load_resource only: [:new, :show, :edit, :update, :destroy]
  authorize_resource except: [:index, :show]

  def index
    @vacancies = Vacancy.all
  end

  def new
  end

  def create
    @vacancy.user = current_user
    if @vacancy.save
      redirect_to vacancies_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @vacancy.update model_params
      redirect_to vacancies_path
    else
      render 'new'
    end
  end

  def destroy
    @vacancy.destroy
    redirect_to vacancies_path
  end

  private
  def model_params
    params.require(:vacancy).permit(:name, :salary, :employment, :expire_at, :skill_list)
  end

  def build_vacancy
    @vacancy = Vacancy.new(model_params)
  end
end
