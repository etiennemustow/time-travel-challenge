class Journey < ApplicationRecord
    has_many :meetings, inverse_of: :journey

    validates :name, presence: true
    validates :start_time, presence: true
    validates :start_date, presence: true
end
