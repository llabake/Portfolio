# frozen_string_literal: true

class Potfolio < ApplicationRecord
  has_many :technologies, inverse_of: :potfolio

  accepts_nested_attributes_for :technologies,
                                allow_destroy: true,
                                reject_if: ->(attr) { attr['name'].blank? }

  validates_presence_of :title, :body

  mount_uploader :thumb_image, PortfolioUploader
  mount_uploader :main_image, PortfolioUploader

  def self.angular
    where(subtitle: 'Angular')
  end

  def self.by_position
    order('position ASC')
  end
  scope :ruby_on_rails_portfolio_items, -> { where(subtitle: 'Angular') }

  # after_initialize :set_defaults
end
