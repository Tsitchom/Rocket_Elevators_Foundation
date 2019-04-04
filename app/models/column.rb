class Column < ApplicationRecord
    belongs_to :battery
    has_many :elevators
    
    enum column_status: [:Active, :Inactive, :Intervention_Needed]
end
