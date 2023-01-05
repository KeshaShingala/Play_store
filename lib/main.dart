import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Homepage(),
    ),
  );
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage>with TickerProviderStateMixin {

  TabController?  tabController;
  PageController pageController = PageController();
  DateTime date = DateTime.now();
  bool isIos = false;
  bool lock = false;


  List<String> months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];
  List<String> day = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday",
  ];




  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return (isIos)
        ? CupertinoApp(
      debugShowCheckedModeBanner: false,
      home : CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          backgroundColor: Colors.white,
          leading: CupertinoSwitch(
            thumbColor:  Colors.blue,
            activeColor:Colors.grey.shade100,
            value: isIos,
            onChanged: (val){
              setState((){
                isIos = val;
              });
            },
          ),
        ),
        child: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
           backgroundColor: Colors.white,
            inactiveColor: Colors.grey,
            activeColor:Colors.blue ,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                label: "Today",
                icon: Icon(Icons.today,
                  size: 25,),),
              BottomNavigationBarItem(
                label: "Games",
                icon: Icon(Icons.games_rounded,
                  size: 25,),),
              BottomNavigationBarItem(
                label:"Apps",
                icon: Icon(Icons.apps_sharp,
                  size: 25,),),
            ],
          ),
          tabBuilder: (context,i){
            return IndexedStack(
              index: i,
              children: [
                Container(
                  child: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${day[date.day]}, ${months[date.month]} ${date.day}", style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,letterSpacing: 1),),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text("Today",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 30),),
                          Spacer(),
                          // SizedBox(width: 10,),
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/images/photo-1438761681033-6461ffad8d80.jpg"),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 400,
                                width: double.infinity,
                                child: Image.asset("assets/images/one.png",fit: BoxFit.fill,)),
                            SizedBox(height: 10,),
                            Container(
                                height: 400,
                                width: double.infinity,
                                child: Image.asset("assets/images/images (3).jfif",fit: BoxFit.fill,)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("Games",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 30),),
                              Spacer(),
                              // SizedBox(width: 10,),
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/images/photo-1438761681033-6461ffad8d80.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          Text("NEW GAME",style: TextStyle(color: Colors.blue,fontSize: 12),),
                          Text("Warhammer aos games : realm war",style: TextStyle(color: Colors.black,fontSize: 20),),
                          Text("Compete in thilling battles",style: TextStyle(color: Colors.grey,fontSize: 17),),
                          SizedBox(height: 8,),
                          Container(
                            height: 400,
                            width: double.infinity,
                            child: Image.asset("assets/images/AoS.jpg",fit: BoxFit.fill,)),
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          free("1", "assets/images/king.jfif","King of Pool","Unlimate AR Pool", "Free app"),
                          SizedBox(height: 10,),
                          free("2", "assets/images/AR.jfif","AR Robot","Built!!", "Free app")
                        ],
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text("App",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 30),),
                              Spacer(),
                              // SizedBox(width: 10,),
                              CircleAvatar(
                                backgroundImage: AssetImage("assets/images/photo-1438761681033-6461ffad8d80.jpg"),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Divider(),
                          SizedBox(height: 10,),
                          Text("NEW WITH SIRI",style: TextStyle(color: Colors.blue,fontSize: 12),),
                          Text("Triplt : Travel",style: TextStyle(color: Colors.black,fontSize: 20),),
                          Text("Quickly get filght",style: TextStyle(color: Colors.grey,fontSize: 17),),
                          SizedBox(height: 10,),
                          Container(
                              height: 400,
                              width: double.infinity,
                              child: Image.asset("assets/images/travel.jfif",fit: BoxFit.fill,)),
                          Divider(),
                          SizedBox(height: 10,),
                          free("1", "assets/images/sky2.png","Sky Guide","View Statrs night", "Open"),
                          SizedBox(height: 10,),
                          free("2", "assets/images/noted.jfif","Noted : Noted,Audi..","Note Taking", "Get")
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          backgroundColor: Colors.white ,
        ),

        backgroundColor: Colors.white,
      ),
    )
        : MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor:  Color(0xff1f1f1f),
          toolbarHeight: 75,
          leading:  Switch(
              inactiveTrackColor:  Color(0xff8596a0),
              inactiveThumbImage: AssetImage("assets/images/download-removebg-preview (1).png"),
              value: isIos,
              onChanged: (val){
                setState((){
                  isIos = val;
                });
              }
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 70,
                width: 335,
                decoration: BoxDecoration(
                  color: Color(0xff253036),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 15,),
                    Icon(Icons.search,color: Color(0xffc2c7cd),size: 27,),
                    SizedBox(width: 15,),
                    Text("Search for apps & games",style: TextStyle(
                      color: Color(0xffc2c7cd),
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),),
                    Spacer(),
                    Icon(Icons.keyboard_voice_outlined,color: Color(0xffc2c7cd),size: 27,),
                    SizedBox(width: 10,),
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/images/IMG_20220909_211245_800 (1).jpg"),
                    ),
                    SizedBox(width: 12,),
                  ],
                ),
              ),
            ),
          ],
          bottom: TabBar(
            controller: tabController!,
            indicatorColor: Color(0xff8ccefe),
            labelColor: Color(0xff8ccefe),
            unselectedLabelColor: Colors.white ,
            tabs: [
              Tab(
                child: Text("For you",style: TextStyle(fontSize: 15),
                ),
              ),
              Tab(
                child: Text("Top charts",style: TextStyle(fontSize: 15),
                ),),
              Tab(
                child: Text("Other devices",style: TextStyle(fontSize: 15),
                ),),
            ],
          ),
        ),
        body:
        TabBarView(
          controller:tabController,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    photos("Recommended for you"),
                    SizedBox(height: 25,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          app("Nest", "4.2", "assets/images/unnamed.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Ntc", "4.6", "assets/images/ntc.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Snapchat", "4.7", "assets/images/snapchat1.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Solarman", "4.0", "assets/images/solarman1.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Spotify", "5.0", "assets/images/spotify (2).png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Tasty", "4.3 ", "assets/images/tasty.png"),
                        ],
                      ),
                    ),
                    SizedBox(height: 25,),
                    photos("New & updated apps"),
                    SizedBox(height: 25,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          app("Weather\nUnderground", "4.6", "assets/images/weather underground.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Airbnb", "4.5", "assets/images/airbnb.jfif"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Google home", "4.3", "assets/images/google home.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Astroyogi", "4.1", "assets/images/astroyogi.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Ullu", "4.7", "assets/images/ullu.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Voot", "4.3", "assets/images/voot.png"),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      children: [
                        Text("Ads",style: TextStyle(color: Colors.white,fontSize: 18),),
                        SizedBox(width: 8,),
                        Container(
                          height: 5,
                          width: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(width: 8,),
                        Text("Suggested for you",style: TextStyle(color: Colors.white,fontSize: 18),),
                        Spacer(),
                        Icon(Icons.east_rounded,size: 20,color: Colors.white,),
                      ],
                    ),
                    SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          app("Jiocinema", "4.6", "assets/images/Jiocinema.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Shemaroome", "4.5", "assets/images/shemaroome.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Ludoking", "4.3", "assets/images/ludoking.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Google pay", "4.1", "assets/images/google-pay.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Swiggy food", "4.7", "assets/images/swiggy food.png"),
                          SizedBox(
                            width: 10,
                          ),
                          app("Zee5", "4.6", "assets/images/Zee5.jpeg"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),


            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 15,),
                      Text("Show installed apps",style: TextStyle(fontSize: 18,color: Colors.grey.shade400),),
                      Spacer(),
                      Switch(
                          value: lock,
                          inactiveTrackColor: Colors.grey.shade800,
                          inactiveThumbColor:Colors.grey,
                          onChanged: (val){
                            setState(() {
                              lock = val;
                            }
                            );
                          }),
                      SizedBox(width: 15,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 15,),
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.green.shade900,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Top free",style: TextStyle(color: Colors.green.shade600,fontSize: 16,fontWeight: FontWeight.w600),),
                      ),
                      SizedBox(width: 15,),
                      Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text("Categories",style: TextStyle(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.w600),),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      free("1","assets/images/snapchat1.png", "Snapchat", "Communication  Social NetWorking", "Installed"),
                      SizedBox(height: 25,),
                      free("2","assets/images/airbnb.jfif", "Airbnb", "Social NetWorking", "Installed"),
                      SizedBox(height: 25,),
                      free("3","assets/images/spotify (2).png", "Spotify", "Singing Social NetWorking", "18 MB"),
                      SizedBox(height: 25,),
                      free("4","assets/images/voot.png", "Voot", "Social NetWorking", "Installed"),
                      SizedBox(height: 25,),
                      free("5","assets/images/weather underground.png", "Weather", "Social NetWorking", "13 MB"),
                      SizedBox(height: 25,),
                      free("6","assets/images/astroyogi.png", "Astroyogi", "Tools", "18 MB"),
                      SizedBox(height: 25,),
                      free("7","assets/images/ludoking.png", "Ludoking", "Gaming app", "Installed"),
                      SizedBox(height: 25,),
                      free("8","assets/images/Netflix.png", "Netflix", "Social NetWorking", " 19 MB"),
                      SizedBox(height: 25,),
                    ],
                  ),
                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.center,
                      height: 35,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.green.shade900,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.tv,color:  Colors.green.shade600,size: 16,),
                          Text("TV",style: TextStyle(color: Colors.green.shade600,fontSize: 16,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    photos("Aim and shoot"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        game("assets/images/1449.jpg", "DEAD TRIGGER 2 : Zombie Games", "4.4","Editers' Choice"),
                        SizedBox(width: 25,),
                        game("assets/images/dead-effect-2-featured-image.jpg", "DEAD Effect 2", "4.3","casual Ofline"),
                      ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    photos("Must-have games"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        game("assets/images/asphalt-8.jpg", "Asphalt 8 -Car Racing Game", "4.5","Racing Ofline"),
                        SizedBox(width: 25,),
                        game("assets/images/shark.jpg", "Hungry Shark Evolution", "4.4","Action Ofline"),
                      ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    photos("Role-Playing Games"),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(children: [
                        game("assets/images/reaper.jpg", "Reaper", "4.3","Role Playing - Offline"),
                        SizedBox(width: 25,),
                        game("assets/images/tale.jpg", "The Bard's Tale", "4.6","Casual Singale player"),
                      ],
                      ),
                    ),
                  ],
                ),
              ),
            ),



          ],
        ),
        // Column(
        //   children: [
        //   ],
        // ),
        // bottomNavigationBar: BottomNavigationBar(
        //   // onTap: (){},
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.videogame_asset),
        //     label: "Game"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.videogame_asset),
        //         label: "Game"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.videogame_asset),
        //         label: "Game"),
        //     BottomNavigationBarItem(
        //         icon: Icon(Icons.videogame_asset),
        //         label: "Game"),
        //   ],
        // ),
        backgroundColor: Color(0xff1f1f1f),
      ),
    );
  }
  Widget photos(String val)
  {
    return  Row(
      children: [
        Text("$val",style: TextStyle(color: Colors.white,fontSize: 18),),
        Spacer(),
        Icon(Icons.east_rounded,size: 20,color: Colors.white,),
      ],
    );
  }

  Widget app(String val, String val1, String image,)
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("$image",height: 130,width: 130,),
        SizedBox(height: 10,),
        Text("$val",style: TextStyle(color: Colors.grey,fontSize: 17),),
        SizedBox(height: 5,),
        Row(
          children: [
            Text("$val1 ",style: TextStyle(color: Colors.grey,fontSize: 17),),
            Icon(Icons.star_rate_rounded,color: Colors.grey,size: 17,),
          ],
        ),
      ],
    );
  }

  Widget game( String image,String name,String rate,String name2){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("${image}",height: 200,width: 200,),
        Text("${name}",style: TextStyle(color: Colors.grey,fontSize: 17),),
        SizedBox(height: 5,),
        Row(
          children: [
            Text("${rate}",style: TextStyle(color: Colors.grey,fontSize: 17),),
            Icon(Icons.star_rate_rounded,color: Colors.grey,size: 17,),
            SizedBox(width: 10),
            Text("${name2}",style: TextStyle(color: Colors.grey,fontSize: 17),),
          ],
        ),
      ],
    );
  }

  Widget  free(String count,String image,String name,String name2,String name3 ){
    return  Container(
      alignment: Alignment.center,
      height: 80,
      child:  Row(
        children: [
          SizedBox(width: 15,),
          Text("${count}",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w600,fontSize: 15),),
          SizedBox(width: 15,),
          Image.asset("${image}",height: 80,width: 80,),
          SizedBox(width: 20,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("${name}",style: TextStyle(color: Colors.grey.shade400,fontSize: 17,fontWeight: FontWeight.w700),),
              //SizedBox(height: 10,),
              Text("${name2}",style: TextStyle(color: Colors.grey.shade800,fontSize: 13,fontWeight: FontWeight.w700),),
              //
              Text("${name3}",style: TextStyle(color: Colors.grey.shade800,fontSize: 13,fontWeight: FontWeight.w700),),
            ],
          ),
        ],
      ),
    );
  }
}


