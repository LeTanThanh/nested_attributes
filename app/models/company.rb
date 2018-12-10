class Company < ApplicationRecord
  has_one :director, dependent: :destroy
end
