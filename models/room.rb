class Room
  class OverCapacity < StandardError; end

  attr_accessor :id
  attr_reader :patients

  def initialize(attributes = {})
    @id       = attributes[:id]
    @capacity = attributes[:capacity]
    @patients = attributes[:patients] || []
  end

  def full?
    @patients.count >= @capacity
  end

  def add_patient(patient)
    raise OverCapacity if full?

    @patients << patient
    patient.room = self
  end
end
