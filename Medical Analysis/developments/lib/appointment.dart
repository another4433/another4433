import 'dart:math';
import 'package:medical_app/doctor.dart';
import 'package:medical_app/patient.dart';
import 'package:flutter/material.dart';

enum AppointmentReason {
  consultation,
  followUp,
  surgery,
  therapy,
  diagnosticTest,
  vaccination,
  emergency,
  teleMedicine,
  checkUp,
  none,
}

enum AppointmentTitle {
  generalCheckup,
  specialVisit,
  preSurgeryConsultation,
  postSurgeryFollowUp,
  therapySession,
  diagnosticImaging,
  vaccinationAppointment,
  emergencyVisit,
  telemedicineConsultation,
  somethingElse,
  none,
}

enum AppointmentStatus {
  scheduled,
  completed,
  canceled,
  noShow,
  rescheduled,
  busy,
  unavailable,
  none,
}

class Appointment {
  Patient _patient;
  Doctor _doctor;
  DateTime _schedule;
  AppointmentReason _reason;
  AppointmentTitle _title;
  AppointmentStatus _status;
  double _aID = 0;

  Appointment(
    this._patient,
    this._doctor,
    this._schedule,
    this._reason,
    this._title,
    this._status,
  ) {
    _aID = generateID();
  }

  double generateID() {
    return Random().nextDouble();
  }

  void setPatient(Patient patient) {
    _patient = patient;
  }

  void setDoctor(Doctor doctor) {
    _doctor = doctor;
  }

  void setSchedule(DateTime schedule) {
    _schedule = schedule;
  }

  void setReason(AppointmentReason reason) {
    _reason = reason;
  }

  void setTitle(AppointmentTitle title) {
    _title = title;
  }

  void setStatus(AppointmentStatus status) {
    _status = status;
  }

  Patient get thePatient => _patient;
  Doctor get theDoctor => _doctor;
  DateTime get theSchedule => _schedule;
  AppointmentReason get reason => _reason;
  AppointmentTitle get title => _title;
  AppointmentStatus get status => _status;
  double get identification => _aID;
}

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
