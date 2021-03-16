import 'package:flutter/material.dart';
import 'package:therapie_clinic/constant.dart';

class MyBookings extends StatefulWidget {
  @override
  _MyBookingsState createState() => _MyBookingsState();
}

class _MyBookingsState extends State<MyBookings> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          "MY BOOKINGS",
        ),
        backgroundColor: kAppColor,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
            ),
            child: buildServiceList(),
          ),
        ),
      ),
    );
  }

  buildServiceList() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          BookingCard(
            'Blow dry',
            '9 - 9:30am',
            '12',
            'Apr',
            kBlueColor,
            '25.5',
          ),
          SizedBox(
            height: 20,
          ),
          BookingCard(
            'Hydrafacial Skin Health',
            '9 - 10am',
            '13',
            'Apr',
            kBlueColor,
            '25.5',
          ),
          SizedBox(
            height: 20,
          ),
          BookingCard(
            'Derma Pen',
            '9 - 10:30am',
            '14',
            'Apr',
            kBlueColor,
            '25.5',
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  var _name;
  var _description;
  var _date;
  var _month;
  var _bgColor;
  var _price;

  BookingCard(
      this._name,this._description, this._date, this._month, this._bgColor, this._price);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: _bgColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            decoration: BoxDecoration(
              color: _bgColor.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  _date,
                  style: TextStyle(
                    color: _bgColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _month,
                  style: TextStyle(
                    color: _bgColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            _name,
            style: TextStyle(
              color: kTitleTextColor.withOpacity(0.7),
            ),
          ),
          subtitle: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      _description,
                      style: TextStyle(
                        color: kTitleTextColor,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 24.0,
                      ),
                      child: RaisedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AdvanceCustomAlert();
                              });
                        },
                        color: Colors.red,
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                            color: kWhiteColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdvanceCustomAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            4.0,
          ),
        ),
        child: Stack(
          overflow: Overflow.visible,
          alignment: Alignment.topCenter,
          children: [
            Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  10,
                  70,
                  10,
                  10,
                ),
                child: Column(
                  children: [
                    Text(
                      'Booking Cancelled!',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      color: kAppColor,
                      child: Text(
                        'OK',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: -60,
              child: CircleAvatar(
                // backgroundColor: Colors.redAccent,
                backgroundImage: AssetImage(
                    'assets/icons/confirm.png'
                ),
                radius: 60,
              ),
            ),
          ],
        ));
  }
}
