# frozen_string_literal: true

class PotfoliosController < ApplicationController
  before_action :set_portfolio_item, only: [:edit, :show, :update, :destroy]
  layout 'potfolio'

  def index
    @potfolio_items = Potfolio.all
  end

  def new
    @potfolio_item = Potfolio.new
    3.times { @potfolio_item.technologies.build }
  end

  def angular
    @angular_potfolio_items = Potfolio.angular
  end

  def create
    @potfolio_item = Potfolio.new(portfolio_params)

    respond_to do |format|
      if @potfolio_item.save
        format.html { redirect_to potfolios_path, notice: 'Your potfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update

    respond_to do |format|
      if @potfolio_item.update(portfolio_params)
        format.html { redirect_to potfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
  end

  def destroy
    # Perform the lookup
    # Destroy/delete the record
    @potfolio_item.destroy
    # Redirect
    respond_to do |format|
      format.html { redirect_to potfolios_path, notice: 'Record was removed ' }
    end
  end

  private

  def portfolio_params
    params.require(:potfolio).permit(:title,
                                     :body,
                                     :subtitle,
                                     technologies_attributes: [:name])
  end


  def set_portfolio_item

    @potfolio_item = Potfolio.find(params[:id])
  end
end
