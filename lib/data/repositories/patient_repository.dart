import 'package:oxygen/data/model/patient_model.dart';

class PatientRepository {

  final List<Patient> _patients = [
    Patient(id: 1, name: "Eleanor Pena", gender: "Female", phone: "9876543210"),
    Patient(id: 2, name: "Wade Warren", gender: "Male", phone: "8765432109"),
    Patient(id: 3, name: "Courtney Henry", gender: "Female", phone: "7654321098"),
  ];

  List<Patient> getAllPatients() => _patients;

  Patient? getPatientById(int id) =>
      _patients.firstWhere((p) => p.id == id, orElse: () => Patient(id: 0, name: '', gender: '', phone: ''));
}
