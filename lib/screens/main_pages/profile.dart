import 'package:flutter/material.dart';
import 'package:meditation/consts.dart';
import 'package:meditation/widgets/chart.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    tabController =TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: const [
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(kProfilePic),
                    ),
                    Text("Afreen Khan",style: TextStyle(color: Colors.white,fontSize: 33,fontWeight: FontWeight.bold),)
                    ,SizedBox(height: 10,)
                    ,Text("Lucknow, India",style: TextStyle(color: Colors.white,fontSize: 21,),)


                  ],
                ),
              ),
              TabBar(controller: tabController,indicatorColor:kGreenLight ,tabs: const [
                Tab(text: "STATS",),
                 Tab(text: "ACHIEVEMENTS",)
              ],),
              Expanded(child: TabBarView(controller: tabController,children:const [
                Chart(),
                Center(
                  child: Text("will add in future",style: TextStyle(color: Colors.white,),
                ))



              ]))

            ],
          ),
        ));
  }
}
