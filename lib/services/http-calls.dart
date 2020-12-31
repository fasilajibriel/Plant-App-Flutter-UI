import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:plant_app/models/requests.dart';

class HTTPCalls {
  static const baseUrl = 'https://blooming-taiga-97959.herokuapp.com';
//  static const baseUrl = 'http://192.168.1.7:8080';
  static const users = '/users';
  static const requests = '/requests';
  static const products = '/products';
  static const cart = '/cart';

  static const get = '/get';
  static const create = '/create';
  static const update = '/update';
  static const delete = '/delete';

  static Future addUser (String firstName, String lastName, String email, String password, String phoneNumber) async {
    Map<String, dynamic> data = {
      'firstName': firstName,
      'lastName': lastName,
      'password': password,
      'email' : email,
      'phoneNumber': phoneNumber
    };

    http.Response response = await http.post(
      baseUrl + users + create,
      headers: {
        'Content-type': 'application/json'
      },
      body: json.encode(data),
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  static Future authenticateUser(String phone, String password) async {
    Map<String, dynamic> data = {
      'phone': phone,
      'password': password
    };

    http.Response response = await http.post(
        baseUrl + users + get,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data)
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  static Future getUserRequests(int id) async {
    Map<String, dynamic> data = {
      'id': id,
    };

    http.Response response = await http.post(
        baseUrl + requests + get,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data)
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body)/*.map((requests) => new Requests.fromJson(requests)).toList()*/;
    } else {
      return false;
    }
  }

  static Future getAllRequests() async {
    http.Response response = await http.post(
        baseUrl + requests + get,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        }
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  static Future getAllProducts() async {
    http.Response response = await http.post(
        baseUrl + products + get,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

  static Future addProduct(String name, int quantity, double price , String link) async {
    Map<String, dynamic> data = {
      'name': name,
      'quantity': quantity,
      'price': price,
      'imgLink': link,
    };

    http.Response response = await http.post(
        baseUrl + products + create,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data)
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body)/*.map((requests) => new Requests.fromJson(requests)).toList()*/;
    } else {
      return false;
    }
  }

  static Future addRequest(int id, String content) async {
    Map<String, dynamic> data = {
      'id': id,
      'content': content,
    };

    http.Response response = await http.post(
        baseUrl + requests + create,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data)
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body)/*.map((requests) => new Requests.fromJson(requests)).toList()*/;
    } else {
      return false;
    }
  }

  static Future addToCart(int user_id, int product_id) async {
    Map<String, dynamic> data = {
      'user_id': user_id,
      'product_id': product_id,
    };

    http.Response response = await http.post(
        baseUrl + cart + create,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data)
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body)/*.map((requests) => new Requests.fromJson(requests)).toList()*/;
    } else {
      return false;
    }
  }

  static Future getUserOrders(int id) async {
    Map<String, dynamic> data = {
      'id': id,
    };

    http.Response response = await http.post(
        baseUrl + cart + get,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        },
        body: json.encode(data)
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body)/*.map((requests) => new Requests.fromJson(requests)).toList()*/;
    } else {
      return false;
    }
  }

  static Future getAllOrders() async {
    http.Response response = await http.post(
        baseUrl + cart + get,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json'
        }
    );

    if(response.body.isNotEmpty) {
      return json.decode(response.body);
    } else {
      return false;
    }
  }

}