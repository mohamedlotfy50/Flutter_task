import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:technical_test/model/auto_complete_model.dart';
import 'package:technical_test/model/place_card_model.dart';
import 'package:technical_test/services/place/places.dart';
import 'package:technical_test/view/core/my_images.dart';
import 'package:technical_test/view/meal/menu_page.dart';
import 'package:technical_test/view/search/place_card.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String inputText = '';
  bool findPlace = false;
  List<Prediction> suggitionList = [];
  PlaceCard placeCard;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: Color(0xFFFA5457),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: Color(0xFFFA5457),
        ),
        actions: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 8,
            ),
            width: 90,
            height: 20,
            child: RaisedButton(
              color: Color(0xFFF6BD1F),
              onPressed: () {},
              child: Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 12,
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SvgPicture.asset(MyImages.company),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Set your work location",
                  style: TextStyle(color: Color(0xFF70798C), fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            !findPlace
                ? Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Color(0xFFFA5457)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          onChanged: (value) async {
                            if (inputText.length > 0) {
                              Map<String, dynamic> json =
                                  await Place().getPlace(inputText);
                              setState(() {
                                suggitionList.clear();

                                suggitionList =
                                    AutoComplete.fromJson(json).predictions;
                              });
                            } else {
                              setState(() {
                                suggitionList.clear();
                              });
                            }
                            setState(() {
                              inputText = value;
                            });
                          },
                          decoration: InputDecoration(
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: inputText.isEmpty
                                  ? Colors.black
                                  : Color(0xFFFA5457),
                            ),
                            suffixIcon: Icon(
                              Icons.search,
                              color: Color(0xFFFA5457),
                            ),
                            enabledBorder: InputBorder.none,
                            labelText: "Work address",
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      if (suggitionList.length > 0 && inputText.isNotEmpty)
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: suggitionList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                ListTile(
                                  onTap: () async {
                                    Map<String, dynamic> d = await Place()
                                        .getDetails(
                                            suggitionList[index].placeId);
                                    placeCard = PlaceCard.fromJson(d);
                                    setState(() {
                                      findPlace = true;
                                    });
                                  },
                                  leading: SvgPicture.asset(
                                    MyImages.locationPin,
                                    width: 30,
                                  ),
                                  subtitle:
                                      Text(suggitionList[index].description),
                                  title: Text(
                                    suggitionList[index]
                                        .structuredFormatting
                                        .mainText,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Color(0xFF01B4BC),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                              ],
                            );
                          },
                        ),
                    ],
                  )
                //the receptionest name and the image is not in the json response
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      PlaceCardPage(
                        companyName: placeCard.result.name,
                        companyAddress: placeCard.result.formattedAddress,
                        companyReception:
                            placeCard.result.addressComponents[1].shortName,
                        companyReceptionPhone:
                            placeCard.result.formattedPhoneNumber,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Color(0xFFDF3C69),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MenuPage()));
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2,
                              color: Color(0xFF01B4BC),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            setState(() {
                              suggitionList.clear();
                              findPlace = false;
                            });
                          },
                          child: Text(
                            "Search Again",
                            style: TextStyle(
                                color: Color(0xFF01B4BC), fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
