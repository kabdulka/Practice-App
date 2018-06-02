class Todo < ApplicationRecord
    
    # we inherit from ApplicationRecord because Rails provides the model 
    # application_record for us
    validates :name, presence: true
    validates :description, presence: true
end
    # ActiveRecord::Base was used in Rails 4