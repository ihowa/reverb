import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:image_form_field/image_form_field.dart';
import 'image_input_adapter.dart';

final _nameController = TextEditingController();
final _address1Controller = TextEditingController();
final _address2Controller = TextEditingController();
final _address3Controller = TextEditingController();
final _dateController = TextEditingController();
final _timeController = TextEditingController();
final _descriptionController = TextEditingController();

class EventMaker extends StatefulWidget {

  @override
  State createState() => _EventMakerState();
}

class _EventMakerState extends State<EventMaker> {

  @override
  Widget build(BuildContext context) {
    return null;
  }
}

Future showEventDialog(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: Text("Create Event"),
        children: <Widget>[
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Event Name",

                    ),
                  ),
                  TextFormField(
                    controller: _address1Controller,
                    decoration: InputDecoration(
                        labelText: "Address Line"
                    ),
                  ),
                  TextFormField(
                    controller: _address2Controller,
                    decoration: InputDecoration(
                        labelText: "City"
                    ),
                  ),
                  TextFormField(
                    controller: _address3Controller,
                    decoration: InputDecoration(
                        labelText: "Country"
                    ),
                  ),
                  DateTimeField(
                    controller: _dateController,
                    format: DateFormat("dd-MM-yyyy"),
                    decoration: InputDecoration(
                      labelText: "Event Date"
                    ),
                    onShowPicker: (context, currentValue) {
                      return showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialDate: currentValue ?? DateTime.now(),
                          lastDate: DateTime(DateTime.now().year + 5),
                      );
                    },
                  ),
                  DateTimeField(
                    controller: _timeController,
                    format: DateFormat("HH:mm"),
                    decoration: InputDecoration(
                        labelText: "Event Time"
                    ),
                    onShowPicker: (context, currentValue) async {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.convert(time);
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: InputDecoration(
                        labelText: "Description"
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  ImageFormField<ImageInputAdapter>(
                    previewImageBuilder: (_, image) => image.widgetize(),
                    buttonBuilder: (_, count) => RaisedButton(
                        child: Text(
                          count == null || count < 1 ? "Upload Image" : "Upload More"
                        ),
                    ),
                    initializeFileAsImage: (file) => ImageInputAdapter(file: file),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              RaisedButton(
                onPressed: null,
                child: Text("Create"),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void _onCreate() {
  //submit event details to database
}