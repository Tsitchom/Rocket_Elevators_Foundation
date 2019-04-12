class Intervention < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :customer, optional: true
  belongs_to :building, optional: true
  belongs_to :battery, optional: true
  belongs_to :column, optional: true
  belongs_to :elevator, optional: true
  belongs_to :employee, optional: true

  # enum intervention_result: [:Success, :Failed, :Incomplete]

  # enum intervention_status: [:Pending, :InProgress, :Interrupted, :Resumed, :Completed]

 
end
