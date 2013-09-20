class TeamSerializer < ActiveModel::Serializer
  attributes :id, :name, :date, :singles_matches, :doubles_matches
end

