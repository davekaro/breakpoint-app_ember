class Team < ActiveRecord::Base
  validates_presence_of :name, :singles_matches, :doubles_matches
end

