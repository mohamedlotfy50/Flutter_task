import 'package:flutter/material.dart';
import 'package:technical_test/model/menu_model.dart';
import 'package:technical_test/services/menu/menu.dart';
import 'package:technical_test/view/core/my_images.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Menu(),
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  Future<MenuModel> json;

  @override
  void initState() {
    json = MenuAPI().getMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: ListView(
            shrinkWrap: true,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    MyImages.delivery,
                    color: Color(0xFFDF3C69),
                    matchTextDirection: false,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Delever to",
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  DropdownButton(
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          "Stc",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                    onChanged: (value) {},
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              //TODO:there is a problem in the banner svg so i substitute it with the coded container
              Row(
                children: [
                  SizedBox(
                    width: 5,
                  ),
                  SvgPicture.asset(
                    MyImages.mealOnTheGo,
                    color: Color(0xFFDF3C69),
                    height: 100,
                    matchTextDirection: false,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFDF3C69),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      //TODO:place the image here
                      child: SvgPicture.asset(
                        MyImages.plusTitle,
                        color: Colors.white,
                        matchTextDirection: false,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enjoy up to 55% of your meal",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Only for Plus members",
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  print("i am working");
                                },
                                child: Container(
                                  child: Center(
                                    child: Text(
                                      "Subscribe",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  width: 120,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFED485F),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ordered by 11:30 Am",
                        style: TextStyle(
                          color: Color(0xFFDF3C69),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "select your meal",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: 150,
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                          unselectedLabelColor: Colors.redAccent,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                              gradient: LinearGradient(colors: [
                                Colors.redAccent,
                                Colors.orangeAccent
                              ]),
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.redAccent),
                          tabs: [
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("All"),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("1"),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text("3"),
                              ),
                            ),
                          ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    MyImages.lightTitle,
                    color: Colors.black87,
                    height: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<MenuModel>(
                  future: json,
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapShot.data.light.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 160,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          snapShot.data.light[index].img,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                        "EGP ${snapShot.data.light[index].regularPrice}"),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        MyImages.plusIcon,
                                        color: Color(0xFFDF3C69),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          "EGP ${snapShot.data.light[index].plusPrice}"),
                                    ],
                                  ),
                                  Text(
                                    snapShot.data.light[index].name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(snapShot.data.light[index].restaurant),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    MyImages.bestValue,
                    color: Colors.black87,
                    height: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<MenuModel>(
                  future: json,
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapShot.data.bestValue.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 160,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          snapShot.data.bestValue[index].img,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                        "EGP ${snapShot.data.bestValue[index].regularPrice}"),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        MyImages.plusIcon,
                                        color: Color(0xFFDF3C69),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          "EGP ${snapShot.data.bestValue[index].plusPrice}"),
                                    ],
                                  ),
                                  Text(
                                    snapShot.data.bestValue[index].name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(snapShot
                                      .data.bestValue[index].restaurant),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    MyImages.plusTitle,
                    color: Colors.black87,
                    height: 50,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<MenuModel>(
                  future: json,
                  builder: (context, snapShot) {
                    if (snapShot.hasData) {
                      return Container(
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapShot.data.plus.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              width: 150,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 160,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          snapShot.data.plus[index].img,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Center(
                                    child: Text(
                                        "EGP ${snapShot.data.plus[index].regularPrice}"),
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        MyImages.plusIcon,
                                        color: Color(0xFFDF3C69),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                          "EGP ${snapShot.data.plus[index].plusPrice}"),
                                    ],
                                  ),
                                  Text(
                                    snapShot.data.plus[index].name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(snapShot.data.plus[index].restaurant),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
