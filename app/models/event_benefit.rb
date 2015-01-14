class EventBenefit < ActiveRecord::Base
  belongs_to :event
  belongs_to :benefit
end
