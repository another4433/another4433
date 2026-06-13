import 'package:flutter/material.dart';
import 'appointment.dart';
import 'doctor.dart';
import 'patient.dart';

class AppointmentEdit extends StatefulWidget {
  const AppointmentEdit({
    super.key,
    required this.receivedAppointment,
    required this.receivedIndex,
  });

  final Appointment receivedAppointment;
  final int receivedIndex;

  @override
  State<AppointmentEdit> createState() => _AppointmentEditState();
}

class _AppointmentEditState extends State<AppointmentEdit> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _dateController = TextEditingController();
  Patient? thePatient;
  Doctor? theDoctor;
  DateTime? date;
  AppointmentReason reason = AppointmentReason.none;
  AppointmentTitle title = AppointmentTitle.none;
  AppointmentStatus status = AppointmentStatus.none;
  Appointment? _appointment;

  @override
  Widget build(BuildContext context) {
    thePatient = widget.receivedAppointment.thePatient;
    theDoctor = widget.receivedAppointment.theDoctor;
    date = widget.receivedAppointment.theSchedule;
    reason = widget.receivedAppointment.reason;
    title = widget.receivedAppointment.title;
    status = widget.receivedAppointment.status;
    return Scaffold(
      appBar: AppBar(
        title: Text("Appointment Data Edit"),
        backgroundColor: Colors.purpleAccent,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Confirmation"),
                      content: Text(
                        "Are you sure you want to make these changes?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Appointment.appointments.remove(
                              widget.receivedAppointment,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "That appointment has been deleted successfully!",
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (BuildContext context) => AppointmentList(),
                              ),
                            );
                          },
                          child: Text("Yes"),
                        ),
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Failed to delete that appointment!",
                                ),
                              ),
                            );
                            Navigator.pop(context);
                          },
                          child: Text("No"),
                        ),
                      ],
                    );
                  },
                );
              });
            },
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Scrollbar(
        controller: _scrollController,
        thumbVisibility: true,
        trackVisibility: true,
        thickness: 5,
        radius: Radius.circular(5),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Date Scheduled"),
                    hintText: date.toString(),
                    icon: Icon(Icons.date_range),
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
                ),
                Card(
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
                Card(
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
                Card(
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
                Card(
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
                          label: AppointmentTitle.diagnosticImaging.toString(),
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
                Card(
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Confirmation"),
                            content: Text(
                              "Are you sure that you want to make these changes?",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    _appointment = Appointment(
                                      thePatient!,
                                      theDoctor!,
                                      date!,
                                      reason,
                                      title,
                                      status,
                                    );
                                    Appointment.appointments[widget
                                            .receivedIndex] =
                                        _appointment!;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "The data of the selected appointment has been edited as per your request.",
                                        ),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text("Yes"),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          "No changes were made to that appointment data!",
                                        ),
                                      ),
                                    );
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text("No"),
                              ),
                            ],
                          );
                        },
                      );
                    });
                  },
                  child: Text("Confirm"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
