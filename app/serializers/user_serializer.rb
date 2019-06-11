class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :animal

  # t.string "name"
  # t.string "type"
  # t.integer "hunger"
  # t.integer "hygiene"
  # t.integer "active"
  # t.integer "energy"
  # t.integer "happy"

  def animal
    if self.object.animals.empty?
      nil
    else
      self.object.animals.map do |animal|
        {
          id: animal.id,
          name: animal.name,
          type: animal.type,
          hunger: animal.hunger,
          hygiene: animal.hygiene,
          active: animal.active,
          energy: animal.engery,
          happy: animal.happy
        }
      end
    end
  end

end
