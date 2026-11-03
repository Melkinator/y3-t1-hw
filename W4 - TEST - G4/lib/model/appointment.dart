import 'person.dart';

enum AppointmentStatus {booked, cancelled}

class Appointment {
  final Patient patient;
  final Doctor doctor;
  final int hour;
  AppointmentStatus status;

  Appointment({required this.patient, required this.doctor, required this.hour, this.status=AppointmentStatus.booked});
}
