require_relative "../models/room"

class RoomRepository
  def initialize(csv_path)
    @rooms    = []
    @csv_path = csv_path
    load_csv
  end

  def all
    @rooms
  end

  def find(id)
    @rooms.find { |room| room.id == id }
  end

  private

  def load_csv
    options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_path, options) do |attributes|
      attributes[:id]       = attributes[:id].to_i
      attributes[:capacity] = attributes[:capacity].to_i
      @rooms << Room.new(attributes)
    end
  end
end
