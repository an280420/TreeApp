class Page < ApplicationRecord
  validates :name, presence: true
  validates :name, format: { with: /\A[a-zA-Zа-яА-Я0-9_]+\z/ }
end
