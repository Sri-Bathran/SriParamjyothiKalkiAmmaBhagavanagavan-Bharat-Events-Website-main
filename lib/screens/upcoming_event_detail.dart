import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kbevents/model/receipt_detail_model.dart';
import 'package:mime/mime.dart';
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import '../constants/color_constant.dart';
import '../constants/constants.dart';
import '../model/course_detail_model.dart';
import '../model/user_model.dart';
import '../providers/user_provider.dart';
import 'package:flutter/material.dart';
import '../utilities/common_widgets.dart';
import '../utilities/dialog_widget.dart';
import '../utilities/mobile_design_widget.dart';

class UpcomingEventDetail extends StatefulWidget {
  final String eventID;
  final String formType;
  final CourseDetailModel? course;
  const UpcomingEventDetail({
    super.key,
    required this.eventID,
    this.course,
    required this.formType,
  });

  @override
  VideoDetailViewState createState() => VideoDetailViewState();
}

class VideoDetailViewState extends State<UpcomingEventDetail> {
  List<String> dasajiNamesList = <String>[];
  File? file;
  XFile? fileWeb;
  // ignore: prefer_typing_uninitialized_variables
  // form key
  final _formKey = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var userMap;
  bool _isChecked = false;
  bool isLoading = false;
  late UserModel loggedInUser;
  bool _isInit = true;
  bool _isLoading = true;
  String? _selectedCountryName;
  CourseDetailModel? courseInfo;
  //String? _dasajiName;
  String? appBarTitle = 'Complete Details';
  String? _selectedState = "Others";
  String? submitButtonLabel = "Submit";
  // editing controller
  final firstNameEditingController = TextEditingController();
  final leaderCityNameEditingController = TextEditingController();
  final leaderNameEditingController = TextEditingController();
  final payeephoneController = TextEditingController();
  final amountController = TextEditingController();
  final bankNameController = TextEditingController();
  final stateController = TextEditingController();
  final aadharController = TextEditingController();
  final panCardController = TextEditingController();
  final addressController = TextEditingController();
  final pincodeController = TextEditingController();
  final dasajiEditingController = TextEditingController();
  final cityNameEditingController = TextEditingController();
  final countryEditingController = TextEditingController();
  final oldDasajiEditingController = TextEditingController();
  final pNameEditingController = TextEditingController();
  final pPhoneEditingController = TextEditingController();
  final phoneController = TextEditingController();
  final emailIdController = TextEditingController();
  final upiController = TextEditingController();
  final paymentDateEditingController = TextEditingController();
  final oldScreenshotEditingController = TextEditingController();

  // getDasajiNames() async {
  //   await FirebaseFirestore.instance
  //       .collection(Constants.dasajiNames)
  //       .doc('K7jRfN1cBdsLtWyiSHMC')
  //       .get()
  //       .then((value) {
  //         setState(() {
  //           // first add the data to the Offset object
  //           dasajiNamesList = List.from(value.data()!['guidename']);
  //           if (dasajiNamesList.isNotEmpty) {
  //             if (!dasajiNamesList.contains(_dasajiName) ||
  //                 dasajiNamesList.isEmpty) {
  //               _dasajiName = 'Others';
  //             }
  //           }
  //         });
  //       });
  // }

  @override
  void initState() {
    super.initState();

    //WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();

    if (_isInit) {
      var loggedInUser = context.watch<UserProvider>().loggedInUser;
      if (loggedInUser.name == "" || loggedInUser.name == null) {
        context.goNamed('Dashboard');
      }
      try {
        final eventID = widget.eventID;
        if (widget.formType == "edit") {
          final paymentDoc =
              await FirebaseFirestore.instance
                  .collection(Constants.users)
                  .doc(loggedInUser.userId)
                  .collection(Constants.userHomaPayments)
                  .doc(eventID)
                  .get();

          if (paymentDoc.exists) {
            final paymentInfo = PaymentDetails.fromMap(paymentDoc);

            firstNameEditingController.text = paymentInfo.name.toString();
            addressController.text = paymentInfo.address;
            cityNameEditingController.text = paymentInfo.cityOrDist;
            if (Constants.indianStates.contains(paymentInfo.state)) {
              stateController.text = paymentInfo.state;
              _selectedState = paymentInfo.state;
            }
            pincodeController.text = paymentInfo.pincode;
            aadharController.text = paymentInfo.aadharOrPan;
            bankNameController.text = paymentInfo.bankName;
            leaderNameEditingController.text = paymentInfo.leaderName;
            leaderCityNameEditingController.text = paymentInfo.leaderCity;
            payeephoneController.text = paymentInfo.phone;
            panCardController.text = paymentInfo.pancardNumber;
            pNameEditingController.text = paymentInfo.participantName;
            pPhoneEditingController.text = paymentInfo.participantPhone;
            amountController.text = paymentInfo.amount;
            upiController.text = paymentInfo.upiID;
            emailIdController.text = paymentInfo.email;
            paymentDateEditingController.text = paymentInfo.paymentDate;
            oldScreenshotEditingController.text = paymentInfo.screenshot;
            phoneController.text = paymentInfo.absentPhone;
            _selectedCountryName = paymentInfo.country;
            countryEditingController.text == paymentInfo.country;
            if (!Constants.countriesList.contains(_selectedCountryName)) {
              _selectedCountryName = Constants.countriesList[0];
              countryEditingController.text = Constants.countriesList[0];
            }
          }
        } else {
          // print(loggedInUser.name);
          // DateTime currentDate = DateTime.now();
          // paymentDateEditingController.text = DateFormat(
          //   'd MMM yyyy',
          // ).format(currentDate);
          firstNameEditingController.text = loggedInUser.name.toString();
          addressController.text = loggedInUser.address.toString();
          cityNameEditingController.text = loggedInUser.city.toString();
          stateController.text = _selectedState.toString();
          pincodeController.text = loggedInUser.pincode.toString();
          countryEditingController.text = loggedInUser.country.toString();
          emailIdController.text = loggedInUser.email.toString();
          payeephoneController.text = loggedInUser.phone!.replaceFirst(
            '+91',
            '',
          );
          _selectedCountryName =
              loggedInUser.country ?? Constants.countriesList[0];
          if (!Constants.countriesList.contains(_selectedCountryName)) {
            _selectedCountryName = Constants.countriesList[0];
            countryEditingController.text = Constants.countriesList[0];
          }
        }

        final courseDoc =
            await FirebaseFirestore.instance
                .collection(Constants.courses)
                .doc(eventID)
                .get();

        // if (courseDoc.exists) {
        //   courseInfo = CourseDetailModel.fromMap(courseDoc);
        // }
        if (courseDoc.exists) {
          final data = courseDoc.data();
          if (data != null) {
            courseInfo = CourseDetailModel.fromMap(courseDoc);
            //  print(courseInfo!.name.toString());
          } else {
            if (mounted) context.goNamed('Dashboard');
            return;
          }
        }
      } catch (e) {
        // print("Error initializing form: $e");
      } finally {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
        }
      }
    }
    _isInit = false;
  }

  Future selectDate() async {
    DateTime currentDate = DateTime.now();
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(
        () =>
            paymentDateEditingController.text = DateFormat(
              'd MMM yyyy',
            ).format(picked),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    //final eventID = widget.eventID;
    final userData = context.watch<UserProvider>().loggedInUser;

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
        // hintText: "Name",
        label: const Text("Payee’s Name"),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final leaderNameField = TextFormField(
      autofocus: false,
      controller: leaderNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Leader's Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Leader's name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        leaderNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "Name",
        label: const Text("Leader's Name"),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    final pNameField = TextFormField(
      autofocus: false,
      controller: pNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Participant Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Participant name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        pNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.account_circle),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "Name",
        label: const Text("Participant Name"),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //Participant phone Number field
    final pPhoneField = TextFormField(
      autofocus: false,
      controller: pPhoneEditingController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter  Participant Phone Number");
        }
        // reg expression for email validation
        if (!RegExp(r'(^[0-9]{10}$)').hasMatch(value)) {
          return ("Please Enter a valid Participant Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        pPhoneEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: "Indian Phone Number",
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        label: const Text("Participant Phone Number"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //Payee phone Number field
    final payeePhoneField = TextFormField(
      autofocus: false,
      controller: payeephoneController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter  Payee’s Phone Number");
        }
        // reg expression for email validation
        if (!RegExp(r'(^[0-9]{10}$)').hasMatch(value)) {
          return ("Please Enter a valid Payee’s Phone Number");
        }
        return null;
      },
      onSaved: (value) {
        payeephoneController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: "Indian Phone Number",
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        label: const Text("Payee’s contact number"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //second name field
    final cityNameField = TextFormField(
      autofocus: false,
      controller: cityNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("City Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        cityNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.maps_home_work_rounded),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: "City",
        label: const Text("City"),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // Payment Date
    final paymentDate = TextFormField(
      // focusNode: _focusNode,
      keyboardType: TextInputType.phone,
      autocorrect: false,
      controller: paymentDateEditingController,
      onSaved: (value) {
        //data.registrationdate = value;
      },
      onTap: () {
        selectDate();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      maxLines: 1,
      validator: (value) {
        if (value!.isEmpty || value.isEmpty) {
          return 'Payment Date';
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Payment Date',

        //filled: true,
        icon: Icon(Icons.calendar_today),
        labelStyle: TextStyle(decorationStyle: TextDecorationStyle.solid),
      ),
    );

    //second name field
    final leaderCityNameField = TextFormField(
      autofocus: false,
      controller: leaderCityNameEditingController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{2,}$');
        if (value!.isEmpty) {
          return ("Leader's City Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Leader's City name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        leaderCityNameEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.maps_home_work_rounded),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: "City",
        label: const Text("Leader's City"),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //second name field
    final addressField = TextFormField(
      autofocus: false,
      controller: addressController,
      keyboardType: TextInputType.name,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Address cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Address(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        addressController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.maps_ugc),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "Address",
        label: const Text("Address"),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //State name field
    // final stateField = TextFormField(
    //   autofocus: false,
    //   controller: stateController,
    //   keyboardType: TextInputType.name,
    //   validator: (value) {
    //     RegExp regex = RegExp(r'^.{2,}$');
    //     if (value!.isEmpty) {
    //       return ("State Name cannot be Empty");
    //     }
    //     if (!regex.hasMatch(value)) {
    //       return ("Enter Valid State(Min. 3 Character)");
    //     }
    //     return null;
    //   },
    //   onSaved: (value) {
    //     stateController.text = value!;
    //   },
    //   textInputAction: TextInputAction.next,
    //   decoration: InputDecoration(
    //     prefixIcon: const Icon(Icons.map_sharp),
    //     contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
    //     // hintText: "State",
    //     label: const Text("State"),
    //     labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
    //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    //   ),
    // );

    final stateField = DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        hint: const Text('State'),
        decoration: const InputDecoration(
          labelText: "State",
          labelStyle: TextStyle(color: Color.fromARGB(255, 158, 157, 157)),
          border: OutlineInputBorder(),
        ),
        value: _selectedState,
        validator: (value) {
          if (value == null) {
            return 'State Name is required';
          }
          return null;
        },
        items:
            Constants.indianStates.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),

        // items: productsList,
        onChanged: (value) {
          FocusScope.of(context).requestFocus(FocusNode());
          stateController.text = value.toString();
          setState(() {
            _selectedState = value.toString();
          });
        },
        isExpanded: true,
      ),
    );

    //pincode field
    final pincodeField = TextFormField(
      autofocus: false,
      controller: pincodeController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{5,}$');
        if (value!.isEmpty) {
          return ("Pincode cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Pincode(Min. 5 Character)");
        }
        return null;
      },
      onSaved: (value) {
        pincodeController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.pin),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "Pincode",
        label: const Text("Pincode"),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //bankNameField field
    final bankNameField = TextFormField(
      autofocus: false,
      controller: bankNameController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{3,}$');
        if (value!.isEmpty) {
          return ("Bank Name cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Bank Name(Min. 3 Character)");
        }
        return null;
      },
      onSaved: (value) {
        bankNameController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.home),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "Gothram",
        label: const Text("Bank Name"),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //second name field
    final aadharField = TextFormField(
      autofocus: false,
      controller: aadharController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^\d{12}$');
        if (value!.isEmpty) {
          return ("Aadhaar cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid Aadhaar No.");
        }
        return null;
      },
      onSaved: (value) {
        aadharController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.card_membership),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: "Adhaar/PAN No.",
        label: const Text("Aadhaar No."),
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // UPI Field

    final upiField = TextFormField(
      autofocus: false,
      controller: upiController,
      keyboardType: TextInputType.text,
      validator: (value) {
        RegExp regex = RegExp(r'^.{5,}$');
        if (value!.isEmpty) {
          return ("UPI ID cannot be Empty");
        }
        if (!regex.hasMatch(value)) {
          return ("Enter Valid UPI ID");
        }
        return null;
      },
      onSaved: (value) {
        upiController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.payment),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //  hintText: "UPI ID",
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        label: const Text("Transaction ID / UPI ID"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //phone Number field
    final phoneField = TextFormField(
      autofocus: false,
      controller: phoneController,
      keyboardType: TextInputType.number,
      validator: (value) {
        // if (value!.isEmpty) {
        //   return ("Please Enter Your Phone");
        // }
        // // reg expression for email validation
        // if (!RegExp(r'(^[0-9]{10}$)').hasMatch(value)) {
        //   return ("Please Enter a valid Phone Number");
        // }
        return null;
      },
      onSaved: (value) {
        phoneController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.phone),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: "Indian Phone Number",
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        label: const Text("Phone Number (for family absent)"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //amount field
    final amountField = TextFormField(
      autofocus: false,
      controller: amountController,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Amount");
        }
        // reg expression for email validation
        if (!RegExp(r'^\d{2,}$').hasMatch(value)) {
          return ("Please Enter a valid Amount");
        }
        return null;
      },
      onSaved: (value) {
        amountController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.currency_rupee),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        //hintText: "Indian Phone Number",
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        label: const Text("Amount"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailIdController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ("Please Enter Your Email");
        }
        // reg expression for email validation
        if (!RegExp(
          r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
        ).hasMatch(value)) {
          return ("Please Enter a valid Email");
        }
        return null;
      },
      onSaved: (value) {
        emailIdController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.email),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        // hintText: "Email",
        labelStyle: TextStyle(color: const Color.fromARGB(255, 158, 157, 157)),
        label: const Text("Email"),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // Country Name

    final countryNamesDropdown = DropdownButtonHideUnderline(
      child: DropdownButtonFormField<String>(
        hint: const Text('Country'),
        decoration: const InputDecoration(
          labelText: "Country",
          labelStyle: TextStyle(color: Color.fromARGB(255, 158, 157, 157)),
          border: OutlineInputBorder(),
        ),
        value: _selectedCountryName,
        validator: (value) {
          if (value == null) {
            return 'Country Name is required';
          }
          return null;
        },
        items:
            Constants.countriesList.map((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),

        // items: productsList,
        onChanged: (value) {
          FocusScope.of(context).requestFocus(FocusNode());
          countryEditingController.text = value.toString();
          setState(() {
            _selectedCountryName = value.toString();
          });
        },
        isExpanded: true,
      ),
    );
    // final loginButton =
    return MobileDesignWidget(
      child: Scaffold(
        backgroundColor: bgColorLightGold,
        appBar: createAppBar("Payment Information"),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                // headerNetworkImage(context, courseInfo.image!),
                const SizedBox(height: 2.0),

                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: createContainer(
                    context,
                    Column(
                      children: [
                        // buildSubHeading(context, 'Event Information'),
                        buildRecordDataFull(
                          "Event Name",
                          courseInfo!.name.toString(),
                        ),
                        // buildRecordDataFull(
                        //     "Amount", "\u20B9 " + courseInfo.inrAmount.toString()),
                        buildHorizantalLine(),

                        buildSubHeading(context, "Register Now"),
                        // buildRecordDataFull("End Date",
                        //     DateFormat('dd-MMM-yyy hh:mm a').format(endDate).toString()),
                        const SizedBox(height: 15.0),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: firstNameField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: payeePhoneField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: emailField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: addressField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: cityNameField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: stateField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: countryNamesDropdown,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: pincodeField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: aadharField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            autofocus: false,
                            controller: panCardController,
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              double? amount = double.tryParse(
                                amountController.text,
                              );
                              if (amount != null && amount > 50000) {
                                if (value == null || value.isEmpty) {
                                  return 'PAN is required for amounts greater than ₹50,000';
                                }
                                RegExp regex = RegExp(
                                  r'^[A-Za-z]{5}[0-9]{4}[A-Za-z]{1}$',
                                );
                                if (!regex.hasMatch(value)) {
                                  return ("Enter Valid Pan No.");
                                }
                              }
                              return null;
                            },
                            onSaved: (value) {
                              panCardController.text = value!;
                            },
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.card_membership),
                              contentPadding: const EdgeInsets.fromLTRB(
                                20,
                                15,
                                20,
                                15,
                              ),
                              //hintText: "Adhaar/PAN No.",
                              label: const Text("PAN No."),
                              labelStyle: TextStyle(
                                color: const Color.fromARGB(255, 158, 157, 157),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: leaderNameField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: leaderCityNameField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: bankNameField,
                        ),

                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: phoneField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: pNameField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: pPhoneField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: amountField,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: paymentDate,
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: upiField,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            const SizedBox(width: 20),
                            Column(
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    chooseImage();
                                  },
                                  icon: Icon(Icons.upload_file),
                                  label: Text("Choose\nScreenshot"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                      255,
                                      101,
                                      155,
                                      249,
                                    ),
                                    foregroundColor: Colors.white,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 14,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                if (widget.formType == "edit")
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "(If you don't upload\n a new screenshot,\n the old screenshot\n will remain.)",
                                      style: TextStyle(fontSize: 10),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            _buildProfileImage(context, file),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Checkbox(
                              value: _isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked = value!;
                                });
                              },
                            ),
                            Flexible(
                              child: Text(
                                'By proceeding with this payment, you confirm your consent to provide your PAN and AADHAR details for verification purposes voluntarily, as required for this event. You affirm that all the information you have provided during registration and payment is accurate and truthful to the best of your knowledge. The system ensures that your personal data, including PAN and AADHAR details, will be securely stored and will not be shared with any third party, except as required by law.',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: createButton(submitButtonLabel, () {
                            if (_formKey.currentState!.validate()) {
                              double? amount = double.tryParse(
                                amountController.text,
                              );
                              if (amount != null &&
                                  amount > 50000 &&
                                  panCardController.text.isEmpty) {
                                showErrorDialog(
                                  context,
                                  "PAN number is required",
                                );
                                return; // Prevent form submission
                              }
                              if (file == null && widget.formType == "add") {
                                showErrorDialog(context, "upload screenshot");
                                return; // Prevent form submission
                              }
                              if (!_isChecked) {
                                // Show a warning if terms are not accepted
                                showErrorDialog(
                                  context,
                                  "You must accept the terms and conditions.",
                                );
                                // ScaffoldMessenger.of(context)
                                //     .showSnackBar(SnackBar(
                                //   content: Text(
                                //       'You must accept the terms and conditions.'),
                                // ));
                                return;
                              }
                              _pay(courseInfo, userData, widget.formType);
                            } else {
                              // Please fill the fields in the form.
                              showErrorDialog(
                                context,
                                "Please fill the fields in the form.",
                              );
                            }
                          }),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),

                // commonCourseInfo(
                //     context, courseInfo, userData, widget.sourceFrom),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImage(context, profileImgUrl) {
    if (profileImgUrl == null) {
      if (oldScreenshotEditingController.text != '') {
        return Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(color: Color(0xffE6E6E6)),
                child: Image.network(
                  oldScreenshotEditingController.text,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        );
      }
      return const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 150,
              height: 150,
              child: DecoratedBox(
                decoration: BoxDecoration(color: Color(0xffE6E6E6)),
                child: Icon(Icons.image, color: Color(0xffCCCCCC), size: 80.0),
              ),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(color: Color(0xffE6E6E6)),
              child: Image.network(file!.path, fit: BoxFit.fitWidth),
            ),
          ],
        ),
      );
    }
  }

  chooseImage() async {
    final picker = ImagePicker();
    XFile? pickedImage;

    try {
      pickedImage = await picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1200,
      );

      // final String fileName = path.basename(pickedImage!.path);

      setState(() {
        file = File(pickedImage!.path);
        fileWeb = pickedImage;
      });
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<String> uploadImageWeb(storageName, orderId) async {
    //String storeNewFileName = DateFormat('d MMM yyyy').format(currentDate);
    final mimeType = lookupMimeType(fileWeb!.name);
    var storeNewFileName = '$orderId${path.extension(fileWeb!.name)}';
    TaskSnapshot taskSnapshot = await FirebaseStorage.instance
        .ref()
        .child(storageName)
        .child(storeNewFileName)
        .putData(
          await fileWeb!.readAsBytes(),
          SettableMetadata(contentType: mimeType!),
        );
    // return "ProfileImages/" + path.basename(file!.path);
    return taskSnapshot.ref.getDownloadURL();
  }

  String extractFileName(String url) {
    // Parse the URL to get the path part
    Uri uri = Uri.parse(url);

    // Extract the file path and decode it
    String filePath = Uri.decodeComponent(uri.pathSegments.last);

    // Use path.basename to get the file name
    String fileName = path.basename(filePath);

    return fileName;
  }

  Future<void> _pay(courseInfo, userData, formType) async {
    DateTime currentDate = DateTime.now();

    String orderId =
        "${getRandomString(8)}_${DateFormat('ddMMyyyyHHmmSS').format(currentDate)}";
    showProcessDialog(context);
    String filePath = "NA";
    String fileName = "NA";
    if (file != null) {
      String storageName = 'kbevents/${courseInfo.courseId}';
      filePath = await uploadImageWeb(storageName, orderId);
      fileName = extractFileName(filePath);

      // deleting old one
      if (formType == "edit") {
        try {
          Reference imageRef = FirebaseStorage.instance.ref().child(
            oldScreenshotEditingController.text,
          );

          // Deleting the image from Firebase Storage
          await imageRef.delete();
        } catch (e) {
          // Handle errors (e.g., file not found, permission issues)
        }
      }
    } else if (file == null && formType == "edit") {
      filePath = oldScreenshotEditingController.text;
      fileName = extractFileName(filePath);
    }

    Map<String, dynamic> paymentDataFields = {
      'courseId': courseInfo.courseId,
      'courseName': courseInfo.name,
      'emailphone': userData.emailphone,
      'createdOn': DateFormat('d MMM yyyy').format(DateTime.now()).toString(),
      'upiID': upiController.text,
      'orderId': orderId,
      'paymentStatus': "Approved",
      'updatedDate': Timestamp.fromDate(DateTime.now()),
      "aadharOrPan": aadharController.text,
      "pancardNumber": panCardController.text,
      "address": addressController.text,
      "amount": amountController.text,
      "cityOrDist": cityNameEditingController.text,
      "email": emailIdController.text,
      "bankName": bankNameController.text,
      "name": firstNameEditingController.text,
      "phone": payeephoneController.text,
      "pincode": pincodeController.text,
      "state": stateController.text,
      "country": countryEditingController.text,
      "leaderName": leaderNameEditingController.text,
      "leaderCity": leaderCityNameEditingController.text,
      "absentPhone": phoneController.text,
      "participantName": pNameEditingController.text,
      "participantPhone": pPhoneEditingController.text,
      "paymentDate": paymentDateEditingController.text,
      "source": "KBE",
      "screenshot": filePath,
      "screenshot_name": fileName,
    };

    if (formType == "add") {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userData.userId)
          .collection(Constants.userHomaPayments)
          .doc(courseInfo.courseId)
          .set(paymentDataFields);

      await FirebaseFirestore.instance
          .collection(Constants.users)
          .doc(userData.userId)
          .update({
            'bharatCourses': FieldValue.arrayUnion([courseInfo.courseId]),
          });
      if (!mounted) return;
      Navigator.pop(context);
      Provider.of<UserProvider>(context, listen: false).getUserData();
      context.goNamed('paymentSuccess');
    } else {
      // deleting old image

      paymentDataFields.remove("source");
      paymentDataFields.remove("createdOn");
      paymentDataFields.remove("orderId");
      paymentDataFields.remove("paymentStatus");
      if (countryEditingController.text == '') {
        paymentDataFields.remove("country");
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userData.userId)
          .collection(Constants.userHomaPayments)
          .doc(courseInfo.courseId)
          .update(paymentDataFields);
      if (!mounted) return;
      Navigator.pop(context);
      showSuccessDialog(context, "Payment details has been updated.", () {
        Navigator.of(context).pop();
        Navigator.pop(context);
      });
    }
  }
}
