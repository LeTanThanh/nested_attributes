class Company < ApplicationRecord
  has_one :director, dependent: :destroy
  has_many :companies, dependent: :destroy

  accepts_nested_attributes_for :director,
    update_only: true,
    allow_destroy: true,
    reject_if: :director_name_blank?

  private

  def director_name_blank? attributes
    attributes[:name].blank?
  end
end
