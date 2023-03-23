import 'package:flutter/material.dart';
import 'package:lima_app/common/widgets/common_button.dart';
import 'package:lima_app/constants/global_variables.dart';
import 'package:lima_app/features/superadmin/services/admin_services.dart';
import 'package:lima_app/models/counties.dart';
import 'package:lima_app/models/sub_county.dart';

class AddCorpScreen extends StatefulWidget {
  static const String routeName = '/addcorp';
  const AddCorpScreen({Key? key}) : super(key: key);

  @override
  State<AddCorpScreen> createState() => _AddCorpScreenState();
}

class _AddCorpScreenState extends State<AddCorpScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final AdminServices adminServices = AdminServices();
  List<Counties> county = [];

  // late String county;
  // late String subCounty;
  // List<Counties> countiesList = [];
  List<SubCounties> subCounty = [];
  final _addCorpFormKey = GlobalKey<FormState>();
  String gender = 'Male';
  List<String> genderList = [
    'Male',
    'Female',
  ];

  @override
  void initState() {
    super.initState();
    fetchAllCounties();
    fetchAllSubCounties();
  }

  fetchAllCounties() async {
    county = await adminServices.fetchAllCounties(context);
    setState(() {});
  }

  fetchAllSubCounties() async {
    subCounty = await adminServices.fetchAllSubCounties(context);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    idNumberController.dispose();
    phoneNoController.dispose();
    genderController.dispose();
    emailController.dispose();
  }

  void addCorp() {
    if (_addCorpFormKey.currentState!.validate()) {
      adminServices.addCorp(
        context: context,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        idNumber: double.parse(idNumberController.text),
        phoneNo: double.parse(phoneNoController.text),
        email: emailController.text,
        gender: gender,
        county: county,
        subCounty: subCounty,
      );
    }
  }

  // void selectCounty() async {
  //   var res = await fetchAllCounties();
  //   setState(() {
  //     county = res;
  //   });
  // }

  // void selectSubCounty() async {
  //   var res = await fetchAllSubCounties();
  //   setState(() {
  //     subCounty = res;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              key: _addCorpFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: firstNameController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person, color: Colors.green),
                      hintText: 'First Name',
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: lastNameController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.person, color: Colors.green),
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: idNumberController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.all_inbox, color: Colors.green),
                      hintText: 'ID Number',
                      labelText: 'ID Number',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email_outlined, color: Colors.green),
                      hintText: 'Email',
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField(
                      value: gender,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      validator: (value) =>
                          value == null ? 'Please select Gender' : null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.people_outline_sharp,
                            color: Colors.green),
                        labelText: "Gender",
                        labelStyle: TextStyle(color: Colors.green),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: genderList.map<DropdownMenuItem<String>>((item) {
                        return DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newVal) {
                        setState(
                          () {
                            gender = newVal!;
                          },
                        );
                      },
                    ),
                  ),
                  TextFormField(
                    controller: phoneNoController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.phone_outlined, color: Colors.green),
                      hintText: 'Phone Number',
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      // value: county,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      validator: (value) =>
                          value == null ? 'Please select County' : null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.place, color: Colors.green),
                        labelText: "Select County",
                        labelStyle: TextStyle(color: Colors.green),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: county.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem(
                          value: value.id,
                          child: Text("${value.name}"),
                        );
                      }).toList(),
                      onChanged: (newVal) async {
                        // county = newVal as List<Counties>;
                        setState(
                          () {
                            county = newVal! as List<Counties>;
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    // onTap: selectCounty(),
                    width: double.infinity,
                    child: DropdownButtonFormField<String>(
                      icon: const Icon(Icons.keyboard_arrow_down),
                      validator: (value) =>
                          value == null ? 'Please select Sub County' : null,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.place_outlined, color: Colors.green),
                        labelText: "Select Sub County",
                        labelStyle: TextStyle(color: Colors.green),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      items: subCounty.map<DropdownMenuItem<String>>((value) {
                        return DropdownMenuItem(
                          value: value.id,
                          child: Text("${value.name}"),
                        );
                      }).toList(),
                      onChanged: (newVal) async {
                        setState(
                          () {
                            subCounty = newVal! as List<SubCounties>;
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: 'Add Corp',
                    // onTap: () {},
                    onTap: addCorp,
                  )
                ],
              )),
        ),
      ),
    );
  }
}
