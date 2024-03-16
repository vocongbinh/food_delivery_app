import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/models/autocomplete_prediction.dart';
import 'package:food_delivery_app/resources/utils/networkUtiliti.dart';
import 'package:food_delivery_app/resources/utils/placeAutoCompele.dart';
import 'package:food_delivery_app/values/app_assets.dart';
import 'package:food_delivery_app/values/app_colors.dart';
import 'package:get/get.dart';

class SearchLocationPage extends StatefulWidget {
  const SearchLocationPage({super.key});

  @override
  State<SearchLocationPage> createState() => _SearchLocationPageState();
}

class _SearchLocationPageState extends State<SearchLocationPage> {
  TextEditingController searchController = new TextEditingController();
  FocusNode myNode = FocusNode();
  List<AutoCompletePrediction> placePredictions = [];

  void placeAutocomplete(String str) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        'maps/api/place/autocomplete/json',
        {"input": str, "key": "AIzaSyBUZ_IPEtLfAxL70V5oLVFcAFPZYNB3sG8"});
    String? response = await NetworkUtility.fetchUrl(uri);
    print(response);
    if (response != null) {
      print(response);
      PlaceAutoCompleteResponse result =
          PlaceAutoCompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  @override
  void initState() {
    myNode.requestFocus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Stack(children: [
        Positioned(
          top: 50,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                      focusNode: myNode,
                      onChanged: (value) {
                        placeAutocomplete(value);
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        filled: true,
                        hintStyle: TextStyle(color: Color(0xff676767)),
                        fillColor: Color(0xfff6f6f6),
                        border: InputBorder.none,
                        hintText: 'Search location',
                      )),
                ),
                TextButton(
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: AppColors.primaryColor),
                  ),
                  onPressed: () {
                    Get.back(result: '');
                  },
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 100,
            left: 0,
            bottom: 0,
            right: 0,
            child: Container(
              height: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                          onTap: () {
                            Get.back(
                                result:
                                    placePredictions[index].description ?? '');
                          },
                          horizontalTitleGap: 0,
                          leading: Icon(Icons.location_on),
                          title: Text(placePredictions[index].description!,
                              maxLines: 2, overflow: TextOverflow.ellipsis)),
                      const Divider(
                        height: 2,
                        thickness: 2,
                        color: Color.fromARGB(255, 236, 234, 234),
                      )
                    ],
                  );
                },
                itemCount: placePredictions.length,
              ),
            ))
      ]),
    ));
  }
}
