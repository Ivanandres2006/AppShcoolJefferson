import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SendGmail extends StatefulWidget {
  final String _profesorGmail;
  final String _profesorName;
  const SendGmail(this._profesorGmail, this._profesorName);

  @override
  _SendGmailState createState() => _SendGmailState();
}

class _SendGmailState extends State<SendGmail> {
  final controllerName = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();

  Future sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String profesorName,
    required String profesorGmail,

    //required String profesor,
  }) async {
    final serviceId = 'service_amq4jc9';
    final templateId = 'template_efx97dh';
    final userId = 'user_rZLBEweqHXkMcZFEb8CrW';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'service_id': serviceId,
          'template_id': templateId,
          'user_id': userId,
          'template_params': {
            'user_name': name,
            'user_email': email,
            'user_subject': subject,
            'user_message': message,
            'user_profesor': profesorName,
            'user_emailProfesor': profesorGmail,
            //'user_profesor': profesor,
          }
        }));

    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Send Gmail',
            //style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          //foregroundColor: Colors.black,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 31),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllerName,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Name',
                          hintText: 'Name'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Email',
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: controllerSubject,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Subject',
                        hintText: 'Subject',
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: controllerMessage,
                        textAlignVertical: TextAlignVertical.top,
                        maxLines: 9,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Message',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 140, top: 495),
              child: FlatButton(
                child: Text('Send'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () {
                  sendEmail(
                    name: controllerName.text,
                    email: controllerEmail.text,
                    subject: controllerSubject.text,
                    message: controllerMessage.text,
                    profesorName: widget._profesorName,
                    profesorGmail: widget._profesorGmail,
                  );
                  controllerMessage.text = '';
                  controllerEmail.text = '';
                  controllerName.text = '';
                  controllerSubject.text = '';
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
