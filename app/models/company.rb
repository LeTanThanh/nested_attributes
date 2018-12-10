class Company < ApplicationRecord
  has_one :director, dependent: :destroy
  has_many :products, dependent: :destroy

  accepts_nested_attributes_for :director,
    update_only: true,
    allow_destroy: true,
    reject_if: :director_name_blank?
  accepts_nested_attributes_for :products,
    allow_destroy: true,
    reject_if: :product_name_blank?,
    limit: 3

  private

  def director_name_blank? attributes
    attributes[:name].blank?
  end

  def product_name_blank? attributes
    attributes[:name].blank?
  end
end
