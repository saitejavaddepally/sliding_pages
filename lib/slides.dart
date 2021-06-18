import 'package:flutter/material.dart';

class Slides {
  String text;
  String caption;
  String image;
  int numPages;
  int currentPage;
  PageController pageController;

  Slides(String text, String caption, String image, int _numpages,
      int _currentPage, PageController controller) {
    this.text = text;
    this.caption = caption;
    this.image = image;
    numPages = _numpages;
    currentPage = _currentPage;
    pageController = controller;
  }

  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < numPages; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(microseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 18.0,
      decoration: BoxDecoration(
          color: isActive ? Colors.white : null,
          border: Border.all(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.circular(20.0)),
      width: isActive ? 18.0 : 18.0,
    );
  }

  Widget slide(BuildContext context) {
    return Column(
      children: [
        Container(
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          padding: EdgeInsets.all(18.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/$image.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.25), BlendMode.srcOver),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: TextButton(
                  child: Text(
                    "Skip",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 80.0),
              Center(
                child: Text(
                  "farmovo".toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0),
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Text(
                  "Grow Naturally, Live Natural",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0),
                ),
              ),
              SizedBox(height: 100.0),
              Center(
                child: Text(
                  "$text",
                  style: TextStyle(color: Colors.white, fontSize: 50.0),
                ),
              ),
              SizedBox(height: 8.0),
              Center(
                child: Text(
                  "$caption",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0),
                ),
              ),
              Center(
                  child: Padding(
                padding: EdgeInsets.only(top: 300.0),
                child: TextButton(
                  child: Text(
                    (currentPage == numPages - 1 ? "get started" : "next")
                        .toUpperCase(),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 130, vertical: 15)),
                      textStyle: MaterialStateProperty.all(TextStyle(
                        color: Colors.black,
                      )),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ))),
                  onPressed: () {
                    pageController.animateToPage(
                        (currentPage < 2) ? currentPage + 1 : currentPage,
                        duration: Duration(milliseconds: 750),
                        curve: Curves.ease);
                  },
                ),
              )),
              if (currentPage == numPages - 1)
                Center(
                  child: TextButton(
                    child: Text(
                      "Log in",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {},
                  ),
                ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: buildPageIndicator(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
