import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:inearu/constants/api.dart';
import 'package:flutter/material.dart';
import 'package:inearu/models/models.dart';
import 'package:inearu/pages/matches_screen.dart';
import 'package:inearu/screen/profile_screen.dart';
import 'package:inearu/widgets/widgets.dart';

class ApiProfileScreen extends StatefulWidget {
  static const String routename = '/apiprofileScreen';
  @override
  _ApiProfileScreenState createState() => _ApiProfileScreenState();
}

class _ApiProfileScreenState extends State<ApiProfileScreen> {
  List<dynamic> _profile = [];
  bool _isLoading = true;
  List<Map<String, dynamic>> imageUrls = [];

  @override
  initState() {
    super.initState();
    _fetchProfile();
  }

  _fetchProfile() async {
    try {
      print("Downloading profile data");
      _profile = await http
          .get(Uri.parse(api))
          .then((response) => json.decode(response.body));

      List<dynamic> imagesIds = _profile[0]['images'];
      imageUrls = await fetchImageUrlsSync(imagesIds);
      print("this is imageUrls: ${imageUrls[0]['image']}");

      setState(() {
        _isLoading = false;
      });
    } catch (e) {
      print("There is some error $e");
    }
  }

  Future<List<Map<String, dynamic>>> fetchImageUrlsSync(
      List<dynamic> imageIds) async {
    print("formatedList called with $imageIds");
    var url = "http://10.0.2.2:8000/image/";

    List<Map<String, dynamic>> finalListOfImages = [];

    for (var id in imageIds) {
      var response = await http.get(Uri.parse(url + id.toString()));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        print(data.runtimeType);
        finalListOfImages.add(data);
      } else {
        print("status code: 404");
      }
    }

    return finalListOfImages;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 62, 18, 18)),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MatchesScreen()));
            },
            icon: Icon(
              Icons.send,
              color: Color.fromARGB(255, 60, 54, 52),
            ),
            color: Colors.black87,
          )
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(3, 3),
                                blurRadius: 3,
                                spreadRadius: 3),
                          ],
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              imageUrls[0]['image'],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(0, 0, 0, 0),
                              Colors.black.withOpacity(0.8),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _profile[0]['first_name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.white),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  _profile[0]['last_name'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline1!
                                      .copyWith(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleWithIcon(title: 'Biography', icon: Icons.edit),
                        Text(
                          "Lorem Es un hecho establecido hace demasiado tiempo que un lector se distraerá con el contenido del texto de un sitio mientras que mira su diseño. El punto de usar Lorem Ipsum es que tiene una distribución más o menos normal de las letras",
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        TitleWithIcon(title: 'Pictures', icon: Icons.edit),
                        SizedBox(
                          height: 125,
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: imageUrls.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    height: 125,
                                    width: 90,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.0),
                                      border: Border.all(
                                          color:
                                              Theme.of(context).primaryColor),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            imageUrls[index]['image']),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        TitleWithIcon(title: 'Location', icon: Icons.edit),
                        Text(
                          "Sunnyvale , Ca",
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(fontWeight: FontWeight.normal),
                        ),
                        TitleWithIcon(title: 'Interest', icon: Icons.edit),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            CustomTextContainer(text: "Not Babysitting"),
                            CustomTextContainer(text: "Dance "),
                            CustomTextContainer(text: "Doing AJ"),
                            CustomTextContainer(text: "Coffee"),
                            CustomTextContainer(text: "Celebrity Gossips"),
                            CustomTextContainer(text: "Movies"),
                            CustomTextContainer(text: "Soccer"),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
