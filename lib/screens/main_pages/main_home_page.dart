import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ionicons/ionicons.dart';
import 'package:meditation/consts.dart';
import 'package:meditation/controller/home_controller.dart';
import 'package:meditation/screens/main_pages/player/playlist.dart';
import 'package:meditation/screens/main_pages/profile.dart';
import 'package:meditation/utils/locator.dart';

import 'home.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<Widget> pages =  const[ Home(), PlayList(), Profile()];
  late HomeController _homeController;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    // TODO: implement initState
    _homeController = locator<HomeController>();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Observer(
                builder: (context) =>
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (SvgPicture.asset(kBergerMenu)),
                    SizedBox(
                        width: 80, height: 90, child: (SvgPicture.asset(kLogo))),
                    _homeController.currentIndex!=2?const CircleAvatar(
                      backgroundImage: AssetImage(kProfilePic),
                    ):const Text("edit",style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body:
             PageView.builder(
              controller: _pageController,
              itemCount: 3,
              onPageChanged: (int index) => _homeController.updateIndex(index),
              itemBuilder: (context, index) => pages[index],
            ),


          bottomNavigationBar: Observer(

            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_homeController.currentIndex != 0) {
                      _pageController.animateToPage(0,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                      _homeController.updateIndex(0);
                    }
                  },
                  child: SizedBox(
                      width: 70,
                      height: 90,
                      child: (SvgPicture.asset(
                        kLogo,
                        color: _homeController.currentIndex != 0
                            ? Colors.grey
                            : Colors.white,
                      ))),
                ),
                GestureDetector(
                  onTap: () {
                    if (_homeController.currentIndex != 1) {
                      _pageController.animateToPage(1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                      _homeController.updateIndex(1);
                    }
                  },
                  child: SizedBox(
                      width: 25,
                      height: 90,
                      child: (SvgPicture.asset(
                        kPlayList,
                        color: _homeController.currentIndex != 1
                            ? Colors.grey
                            : Colors.white,
                      ))),
                ),
                GestureDetector(
                  onTap: () {
                    if (_homeController.currentIndex != 2) {
                      _pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                      _homeController.updateIndex(2);
                    }
                  },
                  child: SizedBox(
                      width: 25,
                      height: 90,
                      child: (SvgPicture.asset(
                        kProfileIcon,
                        color: _homeController.currentIndex != 2
                            ? Colors.grey
                            : Colors.white,
                      ))),
                ),
              ],
            ),
          )),
    );
  }
}
