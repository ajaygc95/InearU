import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:inearu/widgets/custom_bar.dart';

class ApiScreen extends StatefulWidget {
  static const String routeName = '/apiscreen';
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();

    futureAlbum = fetchAlbum();
    print(futureAlbum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: "API Screen"),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.first_name);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            }),
          ),
        ));
  }
}

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("Failed to load album");
  }
}

class Album {
  final int id;
  final int emp_id;
  final String first_name;
  final String last_name;

  const Album(
      {required this.id,
      required this.emp_id,
      required this.first_name,
      required this.last_name});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json["id"],
      first_name: json['first_name'],
      last_name: json['last_name'],
      emp_id: json['emp_id'],
    );
  }
}

// import 'dart:convert';


// import 'package:lockfin/widgets/custom_bar.dart';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';

// import '../models/model.dart';

// class ApiScreen extends StatefulWidget {
//   static const String routeName = '/apiscreen';

//   Client client = http.Client();

//   List<User> user = [];

//   @override
//   void initState() {
//     print("hello");
//     _retrieveData();
//   }


//   _retrieveData() async {
//     user = [];
//     var response = await client
//         .get(Uri.parse("https://jsonplaceholder.typicode.com/todos/1"));
//     var jsondata = jsonDecode(response.body);
//     print(jsondata);
//   }

//   @override
//   State<ApiScreen> createState() => _APiScreenState();
// }

// class _APiScreenState extends State<ApiScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CustomAppBar(title: "API SCREEN"),
//       body: Center(
//         child: Text(
//           'API SCREEN:!!!',
//           style: Theme.of(context).textTheme.headline1,
//         ),
//       ),
//     );
//   }
// }

// // class ApiScreen extends StatelessWidget {
// //   static const String routeName = '/profilescreen';
// //   // final String first_name, last_name, emp_id;

// //   getUserData() async {
// //     var response = await http.get(Uri.parse("http://127.0.0.1:8000/api"));
// //     var jsondata = jsonDecode(response.body);
// //     print(jsondata);
// //     // List<String> user = [];

// //     // for (var u in jsondata) {
// //     //   print(u);
// //     // }
// //   }

// //   const ApiScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     getUserData();
// //     return Scaffold(
// //       appBar: CustomAppBar(title: "API SCREEN"),
// //       body: Center(
// //         child: Text(
// //           'API SLKJDF:!!!',
// //           style: Theme.of(context).textTheme.headline1,
// //         ),
// //       ),
// //     );
// //   }
// // }
