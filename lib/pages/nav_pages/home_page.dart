import 'package:flutter/material.dart';
import 'package:travel_app/misc/colors.dart';
import 'package:travel_app/widgets/app_large_text.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {  //Tabbar için TickerProvider kısmı yapıldı.
  @override
  Widget build(BuildContext context) {
    TabController _tabController= TabController(length: 3, vsync: this);
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 70,left: 20),
              child: Row(
                children: [
                  Icon(Icons.menu,size: 30,),
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.5)
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 30,),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: AppLargeText(text: "Discover"),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.only(left: 20,right: 20),
                  unselectedLabelColor: Colors.black45,
                  isScrollable: true,
                  labelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.label, //indicator labele göre boyutlanıyor.
                    indicator: CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                    controller: _tabController,
                    tabs: [
                      Tab(text: "Places",),
                      Tab(text: "Inspirations",),
                      Tab(text: "Emotions",)

                ]),
              ),
            ),
            Container(
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                  controller: _tabController,
                  children: [
                Text("Places"),
                Text("Inspirations"),
                Text("Emotions")

              ]) ,
            )
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{

  final Color color;
  final double radius;

  CircleTabIndicator({required this.color,required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color:color,radius:radius);
  }
  
}

class _CirclePainter extends BoxPainter{

  final Color color;
  final double radius;

  _CirclePainter({required this.color,required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {  //This method draw circle.

    Paint _paint= Paint();
    _paint.color=color;
    _paint.isAntiAlias=true;  //hardware acceleration???????????????????
    final Offset circleOffset= Offset(configuration.size!.width/2-radius/2, configuration.size!.height-radius);


    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}
