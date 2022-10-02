import 'package:batru_house_rental/data/services/firebase/add_commune_firebase.dart';
import 'package:batru_house_rental/data/services/firebase/add_district_firebase.dart';
import 'package:batru_house_rental/presentation/widgets/buttons/app_button.dart';
import 'package:flutter/material.dart';

class AddType extends StatefulWidget {
  const AddType({super.key});

  @override
  State<AddType> createState() => _AddTypeState();
}

class _AddTypeState extends State<AddType> {
  @override
  void initState() {
    // TODO: implement initState

    // AddDistrictFirebase.addDistrict();
    AddCommuneFirebase.addCommune();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppButton(
            title: 'Add district',
            onButtonTap: () {
              AddDistrictFirebase.addDistrict();
            },
          ),
          AppButton(
            title: 'Add commune',
            onButtonTap: () {
              AddCommuneFirebase.addCommune();
            },
          ),
        ],
      ),
    );
  }
}
