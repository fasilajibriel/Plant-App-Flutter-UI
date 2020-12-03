import 'package:flutter/material.dart';
import 'package:plant_app/services/http-calls.dart';
import 'package:plant_app/services/validator.dart';
import 'package:plant_app/templates/constants.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>();
  TextEditingController productNameController;
  TextEditingController productPriceController;
  TextEditingController imageLinkController;
  TextEditingController quantityController;

  @override
  void initState() {
    super.initState();
    productNameController = TextEditingController();
    productPriceController = TextEditingController();
    imageLinkController = TextEditingController();
    quantityController = TextEditingController();
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
                    return Validator.validateProduct(value, context);
                  },
                  controller: productNameController,
                  decoration: InputDecoration(
                    labelText: "Product Name",
                    hintText: "Plant",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  validator: (value) {
                    return Validator.validateQuantity(value, context);
                  },
                  keyboardType: TextInputType.number,
                  controller: quantityController,
                  decoration: InputDecoration(
                    labelText: "Quantity",
                    hintText: "1",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  validator: (value) {
                    return Validator.validatePrice(value, context);
                  },
                  keyboardType: TextInputType.number,
                  controller: productPriceController,
                  decoration: InputDecoration(
                    labelText: "Price",
                    hintText: "15.99",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15.0),
                child: TextFormField(
                  validator: (value) {
                    return Validator.validateProduct(value, context);
                  },
                  controller: imageLinkController,
                  decoration: InputDecoration(
                    labelText: "Image Link",
                    hintText: "http://example.com/image",
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
                        "Add",
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                      ),
                    ),
                  ),
                  onTap: () {
                    if (formKey.currentState.validate()) {
                      HTTPCalls.addProduct(
                              productNameController.text,
                              int.tryParse(quantityController.text),
                              double.tryParse(productPriceController.text),
                              imageLinkController.text)
                          .then((value) => {
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
