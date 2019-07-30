class Patient
  attr_accessor :id, :name, :room

  def initialize(attributes = {})
    @id    = attributes[:id]
    @name  = attributes[:name]
    @cured = attributes[:cured] || false
    @room  = attributes[:room]  || nil
  end

  def cured!
    @cured = true
  end
end
