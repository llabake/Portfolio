# frozen_string_literal: true

class PotfoliosController < ApplicationController
  def index
    @potfolio_items = Potfolio.all
  end

  def new
    @potfolio_item = Potfolio.new
  end

  def angular
    @angular_potfolio_items = Potfolio.angular
  end
  def create
    @potfolio_item = Potfolio.new(params.require(:potfolio).permit(:title, :body, :subtitle))

    respond_to do |format|
      if @potfolio_item.save
        format.html { redirect_to potfolios_path, notice: 'Your potfolio item is now live' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @potfolio_item = Potfolio.find(params[:id])
  end

  def update
    @potfolio_item = Potfolio.find(params[:id])

    respond_to do |format|
      if @potfolio_item.update(params.require(:potfolio).permit(:title, :body, :subtitle))
        format.html { redirect_to potfolios_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @potfolio_item = Potfolio.find(params[:id])
  end

  def destroy
    # Perform the lookup
    @potfolio_item = Potfolio.find(params[:id])
    # Destroy/delete the record
    @potfolio_item.destroy
    # Redirect
    respond_to do |format|
      format.html { redirect_to potfolios_path, notice: 'Record was removed ' }
    end
  end
end
