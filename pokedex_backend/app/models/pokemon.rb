# == Schema Information
#
# Table name: pokemons
#
#  id         :bigint           not null, primary key
#  number     :integer          not null
#  name       :string           not null
#  attack     :integer          not null
#  defense    :integer          not null
#  poke_type  :string           not null
#  image_url  :string           not null
#  captured   :boolean          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Pokemon < ApplicationRecord
    TYPES = [
        'fire',
        'electric',
        'normal',
        'ghost',
        'psychic',
        'water',
        'bug',
        'dragon',
        'grass',
        'fighting',
        'ice',
        'flying',
        'poison',
        'ground',
        'rock',
        'steel'
      ].sort.freeze

    validates :captured, inclusion: [true, false]
    validates :image_url, presence: true
    validates :name, length: { in: 3..255 }, uniqueness: { message: "'%{value}' is already in use" }
    validates :number, uniqueness: { message: "'%{attribute}' of '%{value}' already exists" }
    validates :poke_type, inclusion: { in: TYPES, message: "'%{value}' is not a valid Pokemon type" }
    validates :attack, :defense, numericality: { in: 0..100 }
    validates :number, numericality: { greater_than: 0, message: "must be greater than 0" }

    has_many :items, dependent: :destroy
    has_many :poke_moves, dependent: :destroy
    has_many :moves,
      through: :poke_moves,
      source: :move
end
