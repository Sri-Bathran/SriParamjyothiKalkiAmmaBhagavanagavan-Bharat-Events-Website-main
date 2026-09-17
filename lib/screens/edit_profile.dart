// ignore_for_file: unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../constants/color_constant.dart';
import '../constants/constants.dart';
import '../model/user_model.dart';
import '../providers/user_provider.dart';
import '../utilities/common_widgets.dart';
import '../utilities/dialog_widget.dart';
import '../utilities/http_exception.dart';
import '../utilities/mobile_design_widget.dart';
import 'home_screen.dart';

// ignore: must_be_immutable
class EditProfile extends StatefulWidget {
  String sourceFrom;
  EditProfile({super.key, required this.sourceFrom});

  @override
  State<EditProfile> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<EditProfile> {
  List<String> dasajiNamesList = <String>[];

  // form key
  final _formKey = GlobalKey<FormState>();
  String? selectedCountryName;
  String? selectedStateName;
  String? selectedUSAStateName;
  String? selectedCanadaStateName;
  String? dasajiName;
  late UserModel loggedInUser;
  var _isInit = true;

  // editing controller
  late final firstNameEditingController = TextEditingController();
  late final stateController = TextEditingController();
  late final addressController = TextEditingController();
  late final cityNameEditingController = TextEditingController();
  late final countryEditingController = TextEditingController();
  late final oldCountryEditingController = TextEditingController();
  late final oldStateController = TextEditingController();
  late final canadaStateController = TextEditingController();
  late final usaStateController = TextEditingController();
  late final lastNameController = TextEditingController();
  late final phoneController = TextEditingController();

  // string for displaying the error Message
  String? errorMessage;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    // Fetch data using the provider and wait for it to complete
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Future<void> didChangeDependencies() async {
    if (_isInit) {
      //Provider.of<UserProvider>(context, listen: false).getUserData();

      loggedInUser = context.watch<UserProvider>().loggedInUser;
      if (loggedInUser.name == "" || loggedInUser.name == null) {
        context.goNamed('Dashboard');
      }

      firstNameEditingController.text = loggedInUser.name.toString();
      cityNameEditingController.text = loggedInUser.city.toString();
      stateController.text = loggedInUser.state.toString();
      phoneController.text = loggedInUser.phone.toString();
      oldCountryEditingController.text = loggedInUser.country.toString();
      countryEditingController.text = loggedInUser.country.toString();
      selectedStateName = loggedInUser.state.toString();
      if (loggedInUser.country.toString() != 'NA') {
        selectedCountryName = loggedInUser.country.toString();

        if (loggedInUser.country.toString() == 'USA' &&
            selectedStateName != "NA") {
          usaStateController.text =
              selectedUSAStateName = loggedInUser.state.toString();
        }
        if (loggedInUser.country.toString() == 'Canada' &&
            selectedStateName != "NA") {
          canadaStateController.text =
              selectedCanadaStateName = loggedInUser.state.toString();
        }
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    String? appBarTitle = 'Complete Registration';
    String submitButtonLabel = "Submit";

    appBarTitle = "Edit Profile";
    submitButtonLabel = "Update";

    final firstNameField = TextFormField(
        autofocus: false,
        controller: firstNameEditingController,
        keyboardType: TextInputType.name,
        validator: (value) {
          RegExp regex = RegExp(r'^.{3,}$');
          if (value!.isEmpty) {
            return ("Name cannot be Empty");
          }
          if (!regex.hasMatch(value)) {
            return ("Enter Valid name(Min. 3 Character)");
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
          hintText: "Name",
          label: const Text("Name"),
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
              countryEditingController.text = value.toString();
              setState(() {
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

            // items: productsList,
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

    final loginButton = createButton("UPDATE", () {
      signUp();
    });

    // if (firstNameEditingController.text == "") {
    //   return SizedBox(
    //     height: MediaQuery.of(context).size.height / 1.3,
    //     child: const Center(
    //       child: CircularProgressIndicator(),
    //     ),
    //   );
    // }

    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar(appBarTitle),
        body: SingleChildScrollView(
          child: Container(
            color: Colors.white,
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
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: phoneField,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: countryNamesDropdown,
                    ),
                    if (countryEditingController.text == 'USA')
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                        child: usaStateField,
                      ),
                    if (countryEditingController.text == 'Canada')
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                        child: canadaStateField,
                      ),
                    if (countryEditingController.text != 'USA' &&
                        countryEditingController.text != 'Canada')
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                        child: stateField,
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                      child: cityNameField,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          loginButton,
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
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
      try {
        Map<String, Object?> postData;
        var stateName = "NA";
        var countryName = "";
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
          countryName = countryEditingController.text;
          stateName = (canadaStateController.text != '')
              ? canadaStateController.text
              : "NA";
        }
        if (countryEditingController.text == "USA") {
          countryName = countryEditingController.text;
          stateName =
              (usaStateController.text != '') ? usaStateController.text : "NA";
        }
        postData = {
          'name': firstNameEditingController.text,
          'city': cityNameEditingController.text,
          'country': (countryName == '')
              ? oldCountryEditingController.text
              : countryName,
          'phone': phoneNumber,
          'state': stateName,
        };

        if (widget.sourceFrom != 'login') {
          await FirebaseFirestore.instance
              .collection(Constants.users)
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .update(postData);
          if (!mounted) return;
          Navigator.pop(context);
          Provider.of<UserProvider>(context, listen: false).getUserData();
          // Fluttertoast.showToast(msg: "Profile has been updated.");
          Navigator.pop(context);
        } else {
          await FirebaseFirestore.instance
              .collection(Constants.users)
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .set(postData);
          if (!mounted) return;
          Navigator.pop(context);
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (c) => const HomeScreen()),
              (route) => false);
        }
      } on HttpException catch (e) {
        Navigator.pop(context);
        showErrorDialog(context, e.toString());
      }
    }
  }
}
