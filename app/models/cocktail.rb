class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  validates :name, presence: true, uniqueness: true

  # def self.search(word)
  #   if word
  #     cocktail_obj = Cocktail.find_by(name: word)
  #       if cocktail_obj
  #         self.where(id: cocktail_obj)
  #       else
  #         @cocktails = Cocktail.all
  #       end
  #     @cocktails = Cocktail.all
  #   end
  # end
end
