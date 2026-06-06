import 'dart:math';
import 'package:medical_app/doctor.dart';
import 'package:medical_app/patient.dart';
import 'package:flutter/material.dart';
import 'package:medical_app/appointment_edit.dart';

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
  static final List<Appointment> _theList = [];

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

  static List<Appointment> get appointments => _theList;
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
    return Scaffold(
      appBar: AppBar(
        title: Text("List of appointments"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: ListView.builder(
        itemCount: Appointment.appointments.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Text(
                "${Appointment.appointments[index].identification}",
              ),
              title: Text(
                "Patient: ${Appointment.appointments[index].thePatient}",
              ),
              subtitle: Text(
                "Doctor: ${Appointment.appointments[index].theDoctor}",
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (BuildContext context) => AppointmentEdit(
                              receivedAppointment:
                                  Appointment.appointments[index],
                              receivedIndex: index,
                            ),
                      ),
                    );
                  });
                },
                icon: Icon(Icons.edit),
              ),
            ),
          );
        },
      ),
      bottomSheet: FloatingActionButton(
        onPressed: () {
          setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => AppointmentData(),
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class AppointmentData extends StatefulWidget {
  const AppointmentData({super.key});

  @override
  State<AppointmentData> createState() => _AppointmentDataState();
}

class _AppointmentDataState extends State<AppointmentData> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _dateController = TextEditingController();
  Patient? thePatient;
  Doctor? theDoctor;
  DateTime? date;
  AppointmentReason reason = AppointmentReason.none;
  AppointmentTitle title = AppointmentTitle.none;
  AppointmentStatus status = AppointmentStatus.none;
  Appointment? _appointment;

  void _submitForm() {
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Cannot submit form unless all fields contains a value.",
          ),
          backgroundColor: Colors.red,
        ),
      );
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Form Submission Failed"),
            content: Text(
              "Empty field were found that prevents this form to be submitted.",
            ),
            icon: Icon(Icons.event_busy),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      _formKey.currentState!.save();
      _appointment = Appointment(
        thePatient!,
        theDoctor!,
        date!,
        reason,
        title,
        status,
      );
      Appointment.appointments.add(_appointment!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Successfully added an appointment!"),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Appointment Data"),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Scrollbar(
        thumbVisibility: true,
        trackVisibility: true,
        controller: _scrollController,
        thickness: 5,
        radius: Radius.circular(8),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    controller: _dateController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Date Scheduled"),
                      hintText: "Enter the date scheduled for the appointment",
                      icon: Icon(Icons.date_range_outlined),
                    ),
                    onChanged: (value) {
                      setState(() {
                        showDatePicker(
                          context: context,
                          firstDate: DateTime(1000),
                          lastDate: DateTime(3000),
                          initialDate: DateTime.now(),
                        ).then((pickedDate) {
                          date = pickedDate;
                          _dateController.text =
                              pickedDate!.toIso8601String().split('T')[0];
                        });
                      });
                    },
                    validator:
                        (value) => "Field is empty! Please enter the date",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: ListTile(
                      title: Text("Patient Selector"),
                      subtitle: Text("Select from the following patients: "),
                      trailing: DropdownMenu(
                        dropdownMenuEntries:
                            Patient.getPatients().map((item) {
                              return DropdownMenuEntry(
                                value: item,
                                label: item.pIdentity.toString(),
                              );
                            }).toList(),
                        onSelected: (value) {
                          setState(() {
                            if (value != null) {
                              thePatient = value;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: ListTile(
                      title: Text("Doctor Selector"),
                      subtitle: Text("Select from the following doctors: "),
                      trailing: DropdownMenu(
                        dropdownMenuEntries:
                            Doctor.getDoctors().map((item) {
                              return DropdownMenuEntry(
                                value: item,
                                label: item.dID.toString(),
                              );
                            }).toList(),
                        onSelected: (value) {
                          setState(() {
                            if (value != null) {
                              theDoctor = value;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: ListTile(
                      title: Text("Appointment Reason Selection"),
                      subtitle: Text("Select from the following reasons:"),
                      trailing: DropdownMenu(
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: AppointmentReason.consultation,
                            label: AppointmentReason.consultation.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.followUp,
                            label: AppointmentReason.followUp.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.surgery,
                            label: AppointmentReason.surgery.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.therapy,
                            label: AppointmentReason.therapy.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.diagnosticTest,
                            label: AppointmentReason.diagnosticTest.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.vaccination,
                            label: AppointmentReason.vaccination.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.emergency,
                            label: AppointmentReason.emergency.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.teleMedicine,
                            label: AppointmentReason.teleMedicine.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.checkUp,
                            label: AppointmentReason.checkUp.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentReason.none,
                            label: AppointmentReason.none.toString(),
                          ),
                        ],
                        onSelected: (value) {
                          setState(() {
                            if (value != null) {
                              reason = value;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: ListTile(
                      title: Text("Appointment Reason Selection"),
                      subtitle: Text("Select from the following reasons:"),
                      trailing: DropdownMenu(
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: AppointmentTitle.generalCheckup,
                            label: AppointmentTitle.generalCheckup.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.specialVisit,
                            label: AppointmentTitle.specialVisit.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.preSurgeryConsultation,
                            label:
                                AppointmentTitle.preSurgeryConsultation
                                    .toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.postSurgeryFollowUp,
                            label:
                                AppointmentTitle.postSurgeryFollowUp.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.therapySession,
                            label: AppointmentTitle.therapySession.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.diagnosticImaging,
                            label:
                                AppointmentTitle.diagnosticImaging.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.vaccinationAppointment,
                            label:
                                AppointmentTitle.vaccinationAppointment
                                    .toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.emergencyVisit,
                            label: AppointmentTitle.emergencyVisit.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.telemedicineConsultation,
                            label:
                                AppointmentTitle.telemedicineConsultation
                                    .toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentTitle.somethingElse,
                            label: AppointmentTitle.somethingElse.toString(),
                          ),
                        ],
                        onSelected: (value) {
                          setState(() {
                            if (value != null) {
                              title = value;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Card(
                    child: ListTile(
                      title: Text("Appointment Reason Selection"),
                      subtitle: Text("Select from the following reasons:"),
                      trailing: DropdownMenu(
                        dropdownMenuEntries: [
                          DropdownMenuEntry(
                            value: AppointmentStatus.scheduled,
                            label: AppointmentStatus.scheduled.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentStatus.completed,
                            label: AppointmentStatus.completed.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentStatus.canceled,
                            label: AppointmentStatus.canceled.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentStatus.noShow,
                            label: AppointmentStatus.noShow.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentStatus.rescheduled,
                            label: AppointmentStatus.rescheduled.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentStatus.busy,
                            label: AppointmentStatus.busy.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentStatus.unavailable,
                            label: AppointmentStatus.unavailable.toString(),
                          ),
                          DropdownMenuEntry(
                            value: AppointmentStatus.none,
                            label: AppointmentStatus.none.toString(),
                          ),
                        ],
                        onSelected: (value) {
                          setState(() {
                            if (value != null) {
                              status = value;
                            }
                          });
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _submitForm();
                      });
                    },
                    child: Text("Add"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
