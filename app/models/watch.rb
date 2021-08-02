class Watch < ApplicationRecord
  belongs_to :profile
  belongs_to :listing
end
