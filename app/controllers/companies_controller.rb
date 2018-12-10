class CompaniesController < ApplicationController
  before_action :load_company, only: %i(show edit update destroy)

  def index
    @companies = Company.all
  end

  def show
  end

  def new
    @company = Company.new
    @company.director = Director.new
    3.times do
      @company.products.build
    end
  end

  def edit
    Director.new company: @company  unless @company.director
    (3 - @company.products.count).times do
      @company.products.build
    end
  end

  def create
    @company = Company.new company_params

    if @company.save
      flash[:success] = "Company was successfully created."
      redirect_to @company
    else
      flash.now[:danger] = "Company wasn't successfully created."
      render :new
    end
  end

  def update
    if @company.update_attributes company_params
      flash[:success] = "Company was successfully updated."
      redirect_to @company
    else
      flash.now[:danger] = "Company wasn't successfully updated."
      render :edit
    end
  end

  def destroy
    if @company.destroy
      flash[:success] = "Company was successfully destroyed."
    else
      flash[:danger] = "Company wasn't successfully destroyed."
    end
    redirect_to companies_url
  end

  private

  def load_company
    @company = Company.find_by id: params[:id]

    unless @company
      flash[:danger] = "Company wasn't found"
      redirect_to companies_path
    end
  end

  def company_params
    params.require(:company).permit(:name,
      director_attributes: [:id, :name, :_destroy],
      products_attributes: [:id, :name, :_destroy])
  end
end
