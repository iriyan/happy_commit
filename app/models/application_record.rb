class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  require 'date'
Date.today
end
