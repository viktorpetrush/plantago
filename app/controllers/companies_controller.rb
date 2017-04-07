class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  def index
    @companies = Company.all
  end

  def new
    @company = Company.new
  end

  def edit
  end

  def show
  end

  def create
    @company = Company.new(company_params)
  
    if @company.save
      redirect_to companies_path
      flash[:notice] = "Company was successfully created."
    else
      render :new
    end
  end

  def update
    if @company.update(company_params)
      redirect_to @company
      flash[:notice] = "Company was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_path
    flash[:notice] = "Company was successfully deleted."
  end

  private

    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :phone, :description)
    end
end
