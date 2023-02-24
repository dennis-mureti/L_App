import 'package:flutter/material.dart';
import 'package:lima_app/common/widgets/loader.dart';
import 'package:lima_app/features/admin/services/admin_services.dart';
import 'package:lima_app/models/getcorp.dart';

class ViewCorpScreen extends StatefulWidget {
  static const String routeName = '/viewcorp';
  const ViewCorpScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ViewCorpScreen> createState() => _ViewCorpScreenState();
}

class _ViewCorpScreenState extends State<ViewCorpScreen> {
  List<GetCorp>? corpList;
  int currentStep = 0;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    // fetchAllCorp();
  }

  fetchAllCorp() async {
    corpList = await adminServices.fetchAllCorp(context);
    setState(() {
      setState(() {
        currentStep += 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return corpList == null
        ? const Loader()
        : GridView.builder(
            itemCount: corpList!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final corpData = corpList![index];
              return GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ViewCorpScreen.routeName,
                    arguments: corpData,
                  );
                },
                // child: SizedBox(
                //   height: 140,
                //   child: SingleProduct(
                //     image: orderData.products[0].images[0],
                //   ),
                // ),
              );
            },
          );
  }
  // return Center(
  //   child: Text('This is the view corp screen'),
  // );

}
