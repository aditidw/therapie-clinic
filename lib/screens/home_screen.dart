import 'package:flutter/material.dart';
import 'package:therapie_clinic/components/clinics_card.dart';
import 'package:therapie_clinic/components/service_card.dart';
import 'package:therapie_clinic/constant.dart';
import 'package:therapie_clinic/screens/Drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DASHBOARD",
        ),
        backgroundColor: kAppColor,
      ),
      drawer: new DrawerWidget(),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Find Your Desired\nDoctor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    color: kTitleTextColor,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Clinics',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildClinicList(),
              // ListView.builder(
              //   itemCount: clinic['data'].length,
              //   itemBuilder: (BuildContext context, int index) =>
              //       new ClinicCard(clinicData: clinic['data'][index]),
              // ),
              // new ListView.builder(
              //   // itemExtent: 160.0,
              //   itemCount: ClinicDao.clinics.length,
              //   itemBuilder: (_, index) => new ClinicCard(ClinicDao.clinics[index]),
              // ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Services',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kTitleTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildServiceList(),
            ],
          ),
        ),
      ),
    );
  }

  // final Clinic clinic;
  int id;
  // clinic = ClinicDao.getClinicById(id);

  buildClinicList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          ClinicCard(
            'London',
            'assets/icons/uk.jpg',
          ),
          SizedBox(
            width: 10,
          ),
          ClinicCard(
            'Belfast',
            'assets/icons/belfast.jpg',
          ),
          SizedBox(
            width: 10,
          ),
          ClinicCard(
            'Dublin',
            'assets/icons/dublin.jpg',
          ),
          SizedBox(
            width: 10,
          ),
          ClinicCard(
            'Waterford',
            'assets/icons/waterford.jpg',
          ),
          SizedBox(
            width: 10,
          ),
          ClinicCard(
            'Dublin',
            'assets/icons/dublin.jpg',
          ),
          SizedBox(
            width: 30,
          ),
        ],
      ),
      // child: new ListView.builder(
      //   itemExtent: 160.0,
      //   itemCount: ClinicDao.clinics.length,
      //   itemBuilder: (_, index) => new ClinicBody(ClinicDao.clinics[index]),
      // ),
    );
  }

  buildServiceList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        children: <Widget>[
          ServiceCard(
            'Blow dry',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          ServiceCard(
            'Hydrafacial Skin Health',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
          ServiceCard(
            'Derma Pen',
            kOrangeColor,
          ),
          SizedBox(
            height: 20,
          ),
          ServiceCard(
            'JetPeel 3V',
            kBlueColor,
          ),
          SizedBox(
            height: 20,
          ),
          ServiceCard(
            'Obagi Blue Radiance Peel',
            kYellowColor,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
