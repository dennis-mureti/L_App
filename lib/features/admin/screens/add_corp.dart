import 'package:flutter/material.dart';
import 'package:lima_app/common/widgets/common_button.dart';
import 'package:lima_app/constants/global_variables.dart';
import 'package:lima_app/features/admin/services/admin_services.dart';
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
  final TextEditingController lasttNameController = TextEditingController();
  final TextEditingController idNumberController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  List<Counties> countiesList = [];
  final AdminServices adminServices = AdminServices();

  late String county;
  late String subCounty;
  // List<Counties> countiesList = [];
  List<SubCounties> subCountiesList = [];
  final _addCorpFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    fetchAllCounties();
    fetchAllSubCounties();
  }

  fetchAllCounties() async {
    countiesList = await adminServices.fetchAllCounties(context);
    setState(() {});
  }

  fetchAllSubCounties() async {
    subCountiesList = await adminServices.fetchAllSubCounties(context);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    firstNameController.dispose();
    lasttNameController.dispose();
    idNumberController.dispose();
    genderController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
  }

  void addCorp() {
    if (_addCorpFormKey.currentState!.validate()) {
      adminServices.addCorp(
          context: context,
          firstName: firstNameController.text,
          lastName: lasttNameController.text,
          idNumber: double.parse(idNumberController.text),
          phoneNo: double.parse(phoneNoController.text),
          email: emailController.text,
          gender: genderController.text,
          county: county,
          subCounty: subCounty);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: const Size.fromHeight(50),
      //   child: AppBar(
      //     centerTitle: false,
      //     flexibleSpace: Container(
      //       decoration: const BoxDecoration(
      //         gradient: GlobalVariables.appBarGradient,
      //       ),
      //     ),
      //     title: const Text(
      //       'Add Corp',
      //       style: TextStyle(color: Colors.white),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
              child: Column(
            children: [
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'First Name',
                  labelText: 'First Name',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              TextFormField(
                controller: lasttNameController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
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
                  icon: Icon(Icons.all_inbox),
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
                  icon: Icon(Icons.email_outlined),
                  hintText: 'Email',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              TextFormField(
                controller: genderController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.people_outline_sharp),
                  hintText: 'Gender',
                  labelText: 'Gender',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              TextFormField(
                controller: phoneNoController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_outlined),
                  hintText: 'Phone Number',
                  labelText: 'Phone Number',
                  labelStyle: TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     icon: Icon(Icons.place),
              //     hintText: 'County',
              //     labelText: 'County',
              //     labelStyle: TextStyle(
              //       color: Colors.green,
              //     ),
              //   ),
              // ),
              //
              // DropdownButton(
              //   value: _selectedValue,
              //   items: countiesList
              //       .map((value) => DropdownMenuItem(
              //           value: value.id, child: Text(value.name),),)
              //       .toList(),
              //   onChanged: (value) {
              //     _selectedValue = value as String;
              //     setState(() {});
              //   },
              // ),
              //
              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  // value: county,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  validator: (value) =>
                      value == null ? 'Please select County' : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.place),
                    labelText: "Select County",
                    labelStyle: TextStyle(color: Colors.green),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  items: countiesList.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem(
                      value: value.id,
                      child: Text("${value.name}"),
                    );
                  }).toList(),
                  onChanged: (newVal) async {
                    countiesList = newVal as List<Counties>;
                    // setState(
                    //   () {
                    //     countiesList = newVal;
                    //   },
                    // );
                  },
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: DropdownButtonFormField<String>(
                  // value: county,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  validator: (value) =>
                      value == null ? 'Please select Sub County' : null,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.place_outlined),
                    labelText: "Select Sub County",
                    labelStyle: TextStyle(color: Colors.green),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  items: subCountiesList.map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem(
                      value: value.id,
                      child: Text("${value.name}"),
                    );
                  }).toList(),
                  onChanged: (newVal) async {
                    setState(
                      () {
                        subCountiesList = newVal! as List<SubCounties>;
                      },
                    );
                  },
                ),
              ),
              // TextFormField(
              //   decoration: const InputDecoration(
              //     icon: Icon(Icons.place_outlined),
              //     hintText: 'Sub County',
              //     labelText: 'Sub County',
              //     labelStyle: TextStyle(
              //       color: Colors.green,
              //     ),
              //   ),
              // )

              const SizedBox(height: 20),
              CustomButton(
                text: 'Add Corp',
                onTap: addCorp,
              )
            ],
          )),
        ),
      ),
    );
  }
}
