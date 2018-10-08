# frozen_string_literal: true

class PotfoliosController < ApplicationController
  def index
    @potfolio_items = Potfolio.all
  end
end
