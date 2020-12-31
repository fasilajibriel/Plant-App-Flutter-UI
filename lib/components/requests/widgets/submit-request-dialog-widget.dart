import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plant_app/services/http-calls.dart';
import 'package:plant_app/services/validator.dart';
import 'package:plant_app/templates/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubmitRequest extends StatefulWidget {
  @override
  _SubmitRequestState createState() => _SubmitRequestState();
}

class _SubmitRequestState extends State<SubmitRequest> {
  final formKey = GlobalKey<FormState>();
  TextEditingController requestContentController;

  @override
  void initState() {
    super.initState();
    requestContentController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size window = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidate: true,
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  validator: (value) {
                    return Validator.validateContent(value, context);
                  },
                  controller: requestContentController,
                  decoration: InputDecoration(
                    labelText: "Content",
                    hintText: "Lorem ipsum . . .",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Material(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(50.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Container(
                    width: 130.0,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (formKey.currentState.validate()) {
                      HTTPCalls.addRequest(
                          Get.find<SharedPreferences>().getInt('userId'),
                          requestContentController.text,
                      ).then((value) => {
                        if(value[0] == null) {
                          Navigator.pop(context, 'success')
                        }
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
