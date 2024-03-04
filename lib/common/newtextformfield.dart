import 'package:flutter/material.dart';

class NewTextFormfield extends StatefulWidget {
  final String yourhinttext;
  final String yourlabletext;
  final iconwidget;
  final TextEditingController controller;
  const NewTextFormfield(
      {super.key,
      this.iconwidget,
      required this.yourhinttext,
      required this.yourlabletext,
      required this.controller});

  @override
  State<NewTextFormfield> createState() => _NewTextFormfieldState();
}

class _NewTextFormfieldState extends State<NewTextFormfield> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            suffixIcon: widget.iconwidget,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            // icon: Icon(Icons.person),

            hintText: widget.yourhinttext,
            labelText: widget.yourlabletext,
          ),
          onSaved: (String? value) {
            // This optional block of code can be used to run
            // code when the user saves the form.
          },
          validator: (String? value) {
            return (value != null && value.contains('@'))
                ? 'Do not use the @ char.'
                : null;
          },
        ),
      ],
    );
  }
}
