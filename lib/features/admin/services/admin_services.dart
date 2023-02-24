import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lima_app/constants/error_handling.dart';
import 'package:lima_app/constants/global_variables.dart';
import 'package:lima_app/constants/utils.dart';
import 'package:lima_app/models/corp.dart';
import 'package:lima_app/models/counties.dart';
import 'package:lima_app/models/getcorp.dart';
import 'package:lima_app/models/sub_county.dart';
import 'package:lima_app/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class AdminServices {
  void addCorp(
      {required BuildContext context,
      required String firstName,
      required String lastName,
      required double idNumber,
      required double phoneNo,
      required String email,
      required String gender,
      required String county,
      required String subCounty}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      Corp corp = Corp(
        firstName: firstName,
        lastName: lastName,
        idNumber: idNumber,
        phoneNo: phoneNo,
        countyId: county,
        subCountyId: subCounty,
      );

      http.Response res = await http.post(Uri.parse('$uri//corps/add'),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'access_token': userProvider.user.token
          },
          body: corp.toJson());
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Corp Added successfully');
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // get all counties
  Future<List<Counties>> fetchAllCounties(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Counties> countiesList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/counties/all'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'access_token': userProvider.user.token,
      });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            countiesList.add(Counties.fromJson(
              jsonEncode(
                jsonDecode(res.body)[i],
              ),
            ));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return countiesList;
  }

  // get all subcounties

  Future<List<SubCounties>> fetchAllSubCounties(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<SubCounties> subCountiesList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/counties/all/subcounties'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'access_token': userProvider.user.token,
      });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            subCountiesList.add(SubCounties.fromJson(
              jsonEncode(
                jsonDecode(res.body)[i],
              ),
            ));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return subCountiesList;
  }

  // get Corps
  Future<List<GetCorp>> fetchAllCorp(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<GetCorp> corpList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/users/persons/all'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'access_token': userProvider.user.token,
      });
      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            corpList.add(GetCorp.fromJson(
              jsonEncode(
                jsonDecode(res.body)[i],
              ),
            ));
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return corpList;
  }
}
