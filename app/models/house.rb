class House < ApplicationRecord
  belongs_to :city
  has_many :datasets
end
