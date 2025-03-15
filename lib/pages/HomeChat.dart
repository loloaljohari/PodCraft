import 'package:flutter/material.dart';
import 'package:podcraft/core/static/themeColors.dart';
import 'package:podcraft/pages/Profile.dart';

class HomeChat extends StatefulWidget {
  const HomeChat({Key? key}) : super(key: key);

  @override
  _HomeChatState createState() => _HomeChatState();
}

class _HomeChatState extends State<HomeChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        leading: Builder(builder: (context) {
          return InkWell(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Image.asset("images/Group 23.png"));
        }),
      ),
      drawer: Drawer(
        backgroundColor: blue2,
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
                width: 194,
                height: 132,
                child: Image.asset(
                  "images/Group 6.png",
                  fit: BoxFit.contain,
                )),
                SizedBox(height: 30,),
                InkWell(
                  onTap: () {
                      Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Profile(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return ScaleTransition(
                          scale: Tween<double>(
                                  begin: 0.0,
                                  end: 1.0) // بداية من صفر إلى الحجم الكامل
                              .animate(CurvedAnimation(
                            parent: animation,
                            curve: Curves.easeInOut, // تخصيص منحنى الحركة
                          )),
                          alignment: Alignment
                              .topLeft, // تحديد نقطة البداية (الزاوية العليا اليسرى)
                          child: child,
                        );
                      },
                    ),
                  ); 
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: gray,width: 0.2)
                                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("My Account",style: TextStyle(color: white,fontSize: 20),),
                          Icon(Icons.arrow_forward,color: white,)
                        ],
                      ),
                    ),
                  ),
                ),
                 InkWell(
                  onTap: () {
                    
                  },
                   child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: gray,width: 0.2)
                                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("New Chat",style: TextStyle(color: white,fontSize: 20),),
                          Icon(Icons.add_circle_outline_outlined,color: white,)
                        ],
                      ),
                    ),
                                   ),
                 ),
                 InkWell(
                  onTap: () {
                    
                  },
                   child: Container(
                    decoration: BoxDecoration(
                      border:Border.all(color: gray,width: 0.2)
                                        ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("All Chats",style: TextStyle(color: white,fontSize: 20),),
                          Icon(Icons.check,color: white,)
                        ],
                      ),
                    ),
                                   ),
                 ),
                        InkWell(
                          onTap: () {
                            
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container( width: double.infinity, child: Text("LogOut",style: TextStyle(color: blue,fontSize: 20),)),
                          ),
                        ),
          ],
        ),
      ),
      body: Container(),
    );
  }
}
