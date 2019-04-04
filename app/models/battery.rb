class Battery < ApplicationRecord
    belongs_to :building
    belongs_to :user
    has_many :columns

    enum battery_status: [:Active, :Inactive, :Intervention_Needed]
end
