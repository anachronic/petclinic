class Doctor < ApplicationRecord
  validates :name, presence: true, format: {
    # from https://stackoverflow.com/a/2630746
    with: /\A[^0-9`!@#\$%\^&*+_=]+\z/,
  }

  # Just a simple one, though we might need to change it
  validates :phone, format: {
    with: /\A\+?\d+/i,
  }

  # Regex from https://emailregex.com/
  validates :email, presence: true, format: {
    with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  }
end
