import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/Constants.dart';

class ApiProvider 
{
  

  
  //Change Password ( Get Contact ) API
  Future<String> changePasswordGetContact(var contact) async
  {
    print(contact);
    http.Response response = await http.post(Constants.BASE_URL+'secretaries/get_contact_update_password',
    body:  {
      'contact' : contact,      
    });
    print(response.body);
    if(response.statusCode == 200)
    {
      var decodedResponse = json.decode(response.body);
      if(decodedResponse['state'] == 'success')
      {
        return 'success';
      }
      else 
      {
        return decodedResponse['msg'];
      }
    }
    else 
    {
      throw Exception('Cannot perform the operation !');
    }
  }
  //Change Password ( Verify OTP ) API
  Future<String> changePasswordVerifyOTP(var contact,var otp) async
  {
    print(contact);
    print(otp);
    http.Response response = await http.post(Constants.BASE_URL+'secretaries/verify_otp_update_password',
    body:  {
      'contact' : contact,      
      'otp' : otp
    });
    print(response.body);
    if(response.statusCode == 200)
    {
      var decodedResponse = json.decode(response.body);
      if(decodedResponse['state'] == 'success') 
      {
        return 'success';
      }
      else 
      {
        return decodedResponse['msg'];
      }
    }
    else 
    {
      throw Exception('Cannot perform the operation !');
    }
  }
  //Confirm Password API
  Future<String> changePasswordConfirmation(var contact,var password) async
  {
    print(contact);
    http.Response response = await http.post(Constants.BASE_URL+'secretaries/update_password',
    body:  {
      'contact' : contact,      
      'password' : password
    });
    print(response.body);
    if(response.statusCode == 200)
    {
      var decodedResponse = json.decode(response.body);
      if(decodedResponse['state'] == 'success') 
      {
        return 'success';
      }
      else 
      {
        return decodedResponse['msg'];
      }
    }
    else 
    {
      throw Exception('Cannot perform the operation !');
    }
  }            
}