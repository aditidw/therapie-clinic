import 'package:therapie_clinic/model/Clinic/Clinic.dart';

class ClinicDao {

  static final List<Clinic> clinics = [
    const Clinic(
      id: "clinic100",
      city: "London",
      country: "United Kingdom",
      streetAddress: "56, Haughton Rd",
      image: "assets/icons/uk.jpg",
    ),
    const Clinic(
      id: "clinic102",
      city: "Belfast",
      country: "Northern Ireland",
      streetAddress: "36-40 Ann Street",
      image: "assets/icons/belfast.jpg",
    ),
    const Clinic(
      id: "clinic103",
      city: "Dublin",
      country: "Ireland",
      streetAddress: "Main St, Malahide (opposite the Garda station)",
      image: "assets/icons/dublin.jpg",
    ),
    const Clinic(
      id: "clinic104",
      city: "Waterford",
      country: "Ireland",
      streetAddress: "31 Barronstrand Street",
      image: "assets/icons/waterford.jpg",
    ),
    const Clinic(
      id: "clinic105",
      city: "Dublin",
      country: "Ireland",
      streetAddress: "40 OâConnell Street",
      image: "assets/icons/dublin.jpg",
    ),
  ];

  static Clinic getClinicById(id) {
    return clinics
        .where((p) => p.id == id)
        .first;
  }
}