class Tweet < ApplicationRecord
  valitades :text, presence: true
end
