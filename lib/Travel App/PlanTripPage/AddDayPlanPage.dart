import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Travel%20App/Widget/MyButton.dart';

class AddDayPlanPage extends StatefulWidget {

  final Function action;
  AddDayPlanPage({this.action});

  @override
  _AddDayPlanPageState createState() => _AddDayPlanPageState();
}

class _AddDayPlanPageState extends State<AddDayPlanPage> with TickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.longestSide;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: height * 0.02,),
        TabBar(
          controller: _tabController,
          labelPadding: EdgeInsets.all(10),
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Constant.green,
          tabs: [
            _tabBarItem("Day 1", "March 21"),
            _tabBarItem("Day 2", "March 22"),
            _tabBarItem("Day 3", "March 23"),
          ],
        ),

        Expanded(
          child: TabBarView(
            children: [
              _tabBarView(),
              SizedBox(),
              SizedBox(),
            ],
            controller: _tabController,
          ),
        ),



        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextButton(
            onPressed: () {
            },
            child: Text("Add activity", style: TextStyle(color: Constant.green, fontWeight: FontWeight.w600),),
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
                backgroundColor: MaterialStateProperty.all(Constant.green.withOpacity(0.2)),
                padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 14))
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: MyButton(action: widget.action, buttonString: "Next Button",),
        ),
      ],
    );
  }

  Widget _tabBarItem(String label, String day) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14),),
        SizedBox(height: 4),
        Text(day, style: TextStyle(color: Colors.black54, fontSize: 12),),

      ],
    );
  }

  Widget _tabBarView() {
    return Container(
      color: Colors.grey[50],
      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey[300])
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 15, color: Colors.grey[400],),
                        SizedBox(width: 4),
                        Expanded(child: Text("5:30", style: TextStyle(fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey[300])
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text("Wake up", style: TextStyle(fontWeight: FontWeight.w500),)),
                        Icon(Icons.single_bed_rounded, size: 20, color: Colors.brown[500],)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey[300])
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 15, color: Colors.grey[400],),
                        SizedBox(width: 4),
                        Expanded(child: Text("6:00", style: TextStyle(fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey[300])
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text("Breakfast", style: TextStyle(fontWeight: FontWeight.w500),)),
                        Icon(Icons.free_breakfast_rounded, size: 20, color: Colors.orange[700],)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey[300])
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 15, color: Colors.grey[400],),
                        SizedBox(width: 4),
                        Expanded(child: Text("7:00", style: TextStyle(fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey[300])
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text("Surfing", style: TextStyle(fontWeight: FontWeight.w500),)),
                        Icon(Icons.videogame_asset, size: 20, color: Colors.green[600],)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 14),
            child: Row(
              children: [
                Flexible(
                  fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey[300])
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.watch_later_outlined, size: 15, color: Colors.grey[400],),
                        SizedBox(width: 4),
                        Expanded(child: Text("9:30", style: TextStyle(fontWeight: FontWeight.w600),)),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  fit: FlexFit.tight,
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Colors.grey[300])
                    ),
                    child: Row(
                      children: [
                        Expanded(child: Text("Sunbathing", style: TextStyle(fontWeight: FontWeight.w500),)),
                        Icon(Icons.wb_sunny, size: 20, color: Colors.yellow[700],)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

