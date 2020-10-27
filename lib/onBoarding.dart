import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'size_config.dart';

class SplashScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: Image.asset('images/splash.png', width: 600, height: 800),
        nextScreen: OnBoardingScreen(),
        backgroundColor: Color(0xFF328bea),
      ),
    );
  }
}

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 5.0),
        height: SizeConfig.screenHeight * 0.013,
        width: isActive
            ? SizeConfig.screenWidth * 0.07
            : SizeConfig.screenWidth * 0.05,
        decoration: BoxDecoration(
            color: isActive ? Colors.white : Color(0xFF0064CE),
            borderRadius: BorderRadius.all(Radius.circular(12))));
  }

  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          height: SizeConfig.blockSizeVertical * 100,
          width: SizeConfig.blockSizeHorizontal * 100,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.1,
                0.4,
                0.7,
                0.9
              ],
                  colors: [
                Color(0xFFdfedf7),
                Color(0xFFaacfee),
                Color(0xFF61a6e9),
                Color(0xFF328bea),
              ])),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () => Navigator.pushNamed(context, '/home'),
                    child: Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: SizeConfig.screenWidth * 0.04,
                          color: Color(0xFF0064CE)),
                    ),
                  ),
                ),
                Container(
                  height: 500.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'images/OnBoard1.png',
                                width: SizeConfig.screenWidth * 0.8,
                                height: SizeConfig.screenHeight * 0.4,
                              ),
                            ),
                            Text(
                              'Lihat Data Covid-19 Terkini di Indonesia',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Dapatkan data aktual terkait kasus Covid-19 yang ada di Indonesia saat ini',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.screenWidth * 0.035,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'images/OnBoard2.png',
                                width: SizeConfig.screenWidth * 0.8,
                                height: SizeConfig.screenHeight * 0.4,
                              ),
                            ),
                            Text(
                              'Atur Jadwal dan Pengingat Minum Obat Harian',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Kontrol dan atur jadwal minum obat untuk menjaga daya tahan tubuh',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.screenWidth * 0.035,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image.asset(
                                'images/OnBoard3.png',
                                width: SizeConfig.screenWidth * 0.8,
                                height: SizeConfig.screenHeight * 0.4,
                              ),
                            ),
                            Text(
                              'Tips dan Trick Seputar Covid-19',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: SizeConfig.screenWidth * 0.06,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Text(
                              'Temukan tips & trick untuk mencegah penularan pandemi Covid-19',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.screenWidth * 0.035,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: () => _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.screenWidth * 0.04,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: SizeConfig.screenWidth * 0.01,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: SizeConfig.screenWidth * 0.05,
                              )
                            ],
                          ),
                        ),
                      ))
                    : Text('')
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: SizeConfig.screenHeight * 0.1,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 5.0, top: 5.0),
                    child: Text(
                      'Mulai',
                      style: TextStyle(
                          color: Color(0xFF0064CE),
                          fontSize: SizeConfig.screenWidth * 0.055,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          : Text(""),
    );
  }
}
