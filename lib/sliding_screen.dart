import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sliding_pages/slides.dart';

class SlidingPages extends StatefulWidget {
  const SlidingPages({Key key}) : super(key: key);

  @override
  _SlidingPagesState createState() => _SlidingPagesState();
}

class _SlidingPagesState extends State<SlidingPages> {
  final int _numPages = 3;
  final PageController pageController = PageController(initialPage: 0);
  int currentPage = 0;
  List<Widget> buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: pageController,
                onPageChanged: (int page) {
                  setState(() {
                    currentPage = page;
                  });
                },
                children: [
                  Slides("Poultry", "We are best poultry in town", "poultry",
                          _numPages, currentPage, pageController)
                      .slide(context),
                  Slides("Agriculture", "cultivating ideas for growth",
                          "agriculture", _numPages, currentPage, pageController)
                      .slide(context),
                  Slides("Cattle", "Simple, Organic, Healthy", "cattle",
                          _numPages, currentPage, pageController)
                      .slide(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
