require_relative "../models/patient"

class PatientRepository
  def initialize(csv_path, room_repository)
    @patients        = []
    @csv_path        = csv_path
    @room_repository = room_repository
    load_csv
  end

  def all
    @patients
  end

  def find(id)
    @patients.find { |patient| patient.id == id }
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, options) do |attributes|
      attributes[:id]      = attributes[:id].to_i
      attributes[:cured]   = attributes[:cured] == "true"

      attributes[:room_id] = attributes[:room_id].to_i

      patient = Patient.new(attributes)
      room = @room_repository.find(attributes[:room_id])
      room.add_patient(patient)

      @patients << patient
    end
  end
end
