import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../constants/color_constant.dart';
import '../constants/constants.dart';
import '../constants/style_constant.dart';
import '../providers/user_provider.dart';
import '../utilities/dialog_widget.dart';
import '../utilities/fire_auth.dart';
import '../utilities/http_exception.dart';
import 'package:flutter/material.dart';

import '../utilities/common_widgets.dart';
import '../utilities/mobile_design_widget.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _LoginScreenState();
}

bool _passwordVisible = false;

class _LoginScreenState extends State<Signup> {
  String? selectedUSAStateName;
  String? selectedCanadaStateName;

  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final firstNameEditingController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final countryEditingController = TextEditingController();
  final usaStateController = TextEditingController();
  final canadaStateController = TextEditingController();
  final stateController = TextEditingController();
  final cityNameEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  // string for displaying the error Message
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("First Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid First Name(Min. 3 Character)");
          }
          return null;
        },
        onSaved: (value) {
          firstNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "First Name",
          label: const Text("First Name"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final cityNameField = TextFormField(
        autofocus: false,
        controller: cityNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          // RegExp regex = RegExp(r'^.{3,}$');
          // if (value!.isEmpty) {
          //   return ("City Name cannot be Empty");
          // }
          // if (!regex.hasMatch(value)) {
          //   return ("Enter Valid name(Min. 3 Character)");
          // }
          return null;
        },
        onSaved: (value) {
          cityNameEditingController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.maps_home_work_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "City",
          label: const Text("City"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //gothramField field
    final lastNameField = TextFormField(
        autofocus: false,
        controller: lastNameController,
        keyboardType: TextInputType.text,
        validator: (value) {
          // RegExp regex = RegExp(r'^.{3,}$');
          // if (value!.isEmpty) {
          //   return ("Gothram / Star cannot be Empty");
          // }
          // if (!regex.hasMatch(value)) {
          //   return ("Enter Valid Gothram / Star(Min. 3 Character)");
          // }
          return null;
        },
        onSaved: (value) {
          lastNameController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.account_circle),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Last Name",
          label: const Text("Last Name"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //second name field
    final phoneField = TextFormField(
        autofocus: false,
        controller: phoneController,
        keyboardType: TextInputType.text,
        validator: (value) {
          //RegExp regex = RegExp(r'^.{3,}$');
          // if (value!.isEmpty) {
          //   return ("Adhaar/PAN No. cannot be Empty");
          // }
          // if (!regex.hasMatch(value)) {
          //   return ("Enter Valid Adhaar/PAN No.");
          // }
          return null;
        },
        onSaved: (value) {
          phoneController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone_android_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone No.",
          label: const Text("Phone No."),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //email field
    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (value!.isEmpty) {
            return ("Please Enter Your Email");
          }
          // reg expression for email validation
          if (!RegExp(
                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
              .hasMatch(value)) {
            return ("Please Enter a valid Email");
          }
          return null;
        },
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          label: const Text("Email"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    //password field
    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: !_passwordVisible,
        validator: (value) {
          RegExp regex = RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Password is required for login");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid Password(Min. 6 Character)");
          }
          return null;
        },
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
            prefixIcon: const Icon(Icons.vpn_key),
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            hintText: "Password",
            label: const Text("Password"),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            )));

    //State name field
    final stateField = TextFormField(
        autofocus: false,
        controller: stateController,
        keyboardType: TextInputType.name,
        validator: (value) {
          // RegExp regex = RegExp(r'^.{2,}$');
          // if (value!.isEmpty) {
          //   return ("State Name cannot be Empty");
          // }
          // if (!regex.hasMatch(value)) {
          //   return ("Enter Valid State(Min. 3 Character)");
          // }
          return null;
        },
        onSaved: (value) {
          stateController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.map_sharp),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "State",
          label: const Text("State"),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

// Country Name
    String? selectedCountryName;

    //State name field

    final countryNamesDropdown = DropdownButtonHideUnderline(
        child: DropdownButtonFormField<String>(
            hint: const Text('Country'),
            decoration: const InputDecoration(
              labelText: "Country",
              border: OutlineInputBorder(),
            ),
            value: selectedCountryName,
            validator: (value) {
              // if (value == null) {
              //   return 'Country Name is required';
              // }
              return null;
            },
            items: Constants.countriesList.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),

            // items: productsList,
            onChanged: (value) {
              FocusScope.of(context).requestFocus(FocusNode());

              setState(() {
                countryEditingController.text = value.toString();
                selectedCountryName = value.toString();
              });
            },
            isExpanded: true));

    final usaStateField = DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
            hint: const Text('Select State'),
            decoration: const InputDecoration(
              labelText: "State",
              border: OutlineInputBorder(),
            ),
            value: selectedUSAStateName,
            validator: (value) {
              // if (value == null) {
              //   return 'Country Name is required';
              // }
              return null;
            },
            items: Constants.usaStates.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            //items: productsList,
            onChanged: (value) {
              FocusScope.of(context).requestFocus(FocusNode());
              usaStateController.text = value.toString();
              setState(() {
                selectedUSAStateName = value.toString();
              });
            },
            isExpanded: true));

    final canadaStateField = DropdownButtonHideUnderline(
        child: DropdownButtonFormField<dynamic>(
            hint: const Text('Select State'),
            decoration: const InputDecoration(
              labelText: "Canada State",
              border: OutlineInputBorder(),
            ),
            value: selectedCanadaStateName,
            validator: (value) {
              // if (value == null) {
              //   return 'Country Name is required';
              // }
              return null;
            },
            items: Constants.canadaStates.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),

            // items: productsList,
            onChanged: (value) {
              FocusScope.of(context).requestFocus(FocusNode());
              canadaStateController.text = value.toString();
              setState(() {
                selectedCanadaStateName = value.toString();
              });
            },
            isExpanded: true));

    final loginButton = createButton("SUBMIT", () {
      signUp();
    });

    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("New Member Registration"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: firstNameField,
                  ),
                  const SizedBox(height: 25.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: lastNameField,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: emailField,
                  ),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: passwordField,
                  ),
                  if (kIsWeb || Platform.isAndroid) const SizedBox(height: 20),
                  if (kIsWeb || Platform.isAndroid)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: phoneField,
                    ),
                  if (kIsWeb || Platform.isAndroid) const SizedBox(height: 20),
                  if (kIsWeb || Platform.isAndroid)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: countryNamesDropdown,
                    ),
                  if (countryEditingController.text != 'USA' &&
                      countryEditingController.text != '' &&
                      countryEditingController.text != 'Canada' &&
                      (kIsWeb || Platform.isAndroid))
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                      child: stateField,
                    ),
                  if (countryEditingController.text == 'USA' &&
                      (kIsWeb || Platform.isAndroid))
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                      child: usaStateField,
                    ),
                  if (countryEditingController.text == 'Canada' &&
                      (kIsWeb || Platform.isAndroid))
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                      child: canadaStateField,
                    ),
                  if (kIsWeb || Platform.isAndroid)
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                      child: cityNameField,
                    ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Back to Login',
                            style: mLinkTextStyle,
                          ),
                        ),
                        loginButton,
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // login function
  void signUp() async {
    if (_formKey.currentState!.validate()) {
      showProcessDialog(context);
      var stateName = "NA";
      var countryName = "NA";
      var cityName = (cityNameEditingController.text != '')
          ? cityNameEditingController.text
          : "NA";
      var phoneNumber =
          (phoneController.text != '') ? phoneController.text : "NA";
      countryName = (countryEditingController.text != '')
          ? countryEditingController.text
          : "Others";

      stateName = (stateController.text != '') ? stateController.text : "NA";
      if (countryEditingController.text == "Canada") {
        stateName = (canadaStateController.text != '')
            ? canadaStateController.text
            : "NA";
      }
      if (countryEditingController.text == "USA") {
        countryName = countryEditingController.text;
        stateName =
            (usaStateController.text != '') ? usaStateController.text : "NA";
      }
      try {
        await FireAuth.registerUsingEmailPassword(
            name: firstNameEditingController.text,
            lastName: lastNameController.text,
            email: emailController.text,
            password: passwordController.text,
            phone: phoneNumber,
            country: countryName,
            state: stateName,
            city: cityName);
        if (!mounted) return;
        Provider.of<UserProvider>(context, listen: false).getUserData();
        Navigator.pop(context);
        context.goNamed('dashboard');
      } on HttpException catch (e) {
        Navigator.pop(context);
        showErrorDialog(context, e.toString());
      }
    }
  }
}
