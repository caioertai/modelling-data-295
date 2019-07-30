require "pry-byebug"
require "csv"
require_relative "repositories/room_repository"
require_relative "repositories/patient_repository"

room_repository = RoomRepository.new("data/rooms.csv")
patient_repository = PatientRepository.new("data/patients.csv", room_repository)

p patient_repository.all
p room_repository.all
