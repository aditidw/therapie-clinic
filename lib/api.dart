import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences prefs;
String base_url =
    "https://y9udv0cjoh.execute-api.eu-west-1.amazonaws.com/dwivedia";
String x_api_key = "AHg8CLFPGk31J8IZhsiXHaIp5Hbt77VTaGjH38Vo";
Map services, serviceID, customers, customerid, clinics, clinicid, clinicDetail, booking;

//Get API call services
Future<Map> getServices() async {
  final response = await http.get(
    Uri.parse(base_url + '/services'),
    headers: {
      'x-api-key': x_api_key,
      'Content-Type': 'application/json',
    },
  );
  services = json.decode(response.body);
  if (services['success'] || response.statusCode == 200) {
    print("Get Services: $services");
  } else {
    throw Exception('Failed to Load Services');
  }
  return services;
}

//Get API call services with ID
Future<Map> getServicesID(String serviceId) async {
  final response = await http.get(
    Uri.parse(base_url + '/services/' + serviceId),
    headers: {
      'x-api-key': x_api_key,
      'Content-Type': 'application/json',
    },
  );
  serviceID = json.decode(response.body);
  if (serviceID['success'] || response.statusCode == 200) {
    print("Get Services ID: $serviceID");
  } else {
    throw Exception('Failed to Load Service ID');
  }
  return serviceID;
}

//Get API call for customers
Future<Map> getCustomers() async {
  final response = await http.get(
    Uri.parse(base_url + '/customers'),
    headers: {
      'x-api-key': x_api_key,
      'Content-Type': 'application/json',
    },
  );
  customers = json.decode(response.body);
  if (customers['success'] || response.statusCode == 200) {
    print("Get customers: $customers");
  } else {
    throw Exception('Failed to Load customers');
  }
  return customers;
}

//Get API call for customers ID
Future<Map> getCustomersID(String customerID) async {
  final response = await http.get(
    Uri.parse(base_url + '/customers/' + customerID),
    headers: {
      'x-api-key': x_api_key,
      'Content-Type': 'application/json',
    },
  );
  customerid = json.decode(response.body);
  if (customerid['success'] || response.statusCode == 200) {
    print("Get customerid: $customerid");
  } else {
    throw Exception('Failed to Load customerid');
  }
  return customerid;
}

//Get API call for clinics
Future<Map> getClinic() async {
  final response = await http.get(
    Uri.parse(base_url + '/clinics'),
    headers: {
      'x-api-key': x_api_key,
      'Content-Type': 'application/json',
    },
  );
  clinics = json.decode(response.body);
  if (clinics['success'] || response.statusCode == 200) {
    print("Get clinics: $clinics");
  } else {
    throw Exception('Failed to Load clinics');
  }
  return clinics;
}

//Get API call for clinics ID
Future<Map> getClinicID(String clinicID) async {
  final response = await http.get(
    Uri.parse(base_url + '/clinics/' + clinicID),
    headers: {
      'x-api-key': x_api_key,
      'Content-Type': 'application/json',
    },
  );
  clinicid = json.decode(response.body);
  if (clinicid['success'] || response.statusCode == 200) {
    print("Get clinicid: $clinicid");
  } else {
    throw Exception('Failed to Load clinicid');
  }
  return clinicid;
}

//Get API call for clinics Details
Future<Map> getClinicDetails(String cliID, String serID) async {
  final response = await http.get(
    Uri.parse(base_url + '/clinics/' + cliID + '/services/' + serID + '/timeslots/yyyy-mm-dd'),
    headers: {
      'x-api-key': x_api_key,
      'Content-Type': 'application/json',
    },
  );
  clinicDetail = json.decode(response.body);
  if (clinicDetail['success'] || response.statusCode == 200) {
    print("Get clinic Detail: $clinicDetail");
  } else {
    throw Exception('Failed to Load clinic Detail');
  }
  return clinicDetail;
}

//Get API call for Bookings
Future<Map> getBookings(String clinID) async {
  final response = await http.get(
    Uri.parse(base_url + '/clinics/' + clinID + '/bookings'),
    headers: {
      'x-api-key': x_api_key,
      'Content-Type': 'application/json',
    },
  );
  booking = json.decode(response.body);
  if (booking['success'] || response.statusCode == 200) {
    print("Get booking: $booking");
  } else {
    throw Exception('Failed to Load booking');
  }
  return booking;
}

//Post API call for Bookings
http.Client client = new http.Client();
Future<Map> postBookings(String clinicID, String custID, String serviID, String date, String startTime) async {
  prefs = await SharedPreferences.getInstance();
  http.Response res = await http.post(Uri.parse(base_url + '/bookings'), body: {
    "clinicId": clinicID,
    "customerId": custID,
    "serviceId": serviID,
    "date": date,
    "startTime": startTime,
  }); // post api call

  Map data = json.decode(res.body);
  if (data['success']) {}
}