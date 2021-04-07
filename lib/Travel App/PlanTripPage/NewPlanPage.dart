import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Travel%20App/PlanTripPage/AddDayPlanPage.dart';
import 'package:flutter_ui_challenges/Travel%20App/PlanTripPage/AddHotelAndFlightPage.dart';
import 'package:flutter_ui_challenges/Travel%20App/Widget/MyButton.dart';

class NewPlanPage extends StatefulWidget {

  final String imageUrl;
  final String place;
  NewPlanPage({@required this.imageUrl, @required this.place});

  @override
  _NewPlanPageState createState() => _NewPlanPageState();
}

class _NewPlanPageState extends State<NewPlanPage> with TickerProviderStateMixin{

  int _currentPage = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      keepPage: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.longestSide;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int value) {
          setState(() {
            _currentPage = value;
          });
          //_currentPage = value;
        },
        children: [
          _newPlanPage(height),

          AddDayPlanPage(action: goToNextPage,),

          AddHotelAndFlightPage(action: goToNextPage,),

        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          _currentPage == 0
              ? Navigator.pop(context)
              : _pageController.previousPage(duration: Duration(milliseconds: 100), curve: Curves.easeIn);
        },
      ),
      title: Text(
        _currentPage == 0
            ? "New plan"
            :  _currentPage == 1
            ? "Add day plans"
            : "Add hotels and flights",
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _newPlanPage(double height) {
    return ListView(
      children: [
        SizedBox(height: height * 0.01),

        _imageWidget(height),

        SizedBox(height: height * 0.03),

        _textWidget("Select dates"),

        _datePicker(),

        _textWidget("Add people"),

        SizedBox(height: height * 0.02),

        _addPeopleWidget(),

        SizedBox(height: height * 0.05),

        _sendInvitesWidget(),

        SizedBox(height: height * 0.02),

        _nextButton(),
      ],
    );
  }

  Widget _imageWidget(double height) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset(
              widget.imageUrl,
              height: height * 0.12,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            Positioned(
              left: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Destination",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    widget.place,
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _textWidget(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(title, style: TextStyle(fontWeight: FontWeight.w600),),
    );
  }

  Widget _addPeopleWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search people...",
                hintStyle: TextStyle(color: Colors.black26),
                prefixIcon: Icon(Icons.people_outline_rounded, color: Colors.black26,),
                contentPadding: EdgeInsets.zero,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.black12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.black12),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Constant.green
            ),
            child: IconButton(
              color: Colors.white,
              icon: Icon(Icons.send_rounded),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  bool _enabled = true;
  Widget _sendInvitesWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(child: Text("Send invites via e-mail")),
          Switch(
            value: _enabled,
            onChanged: (value) {
              setState(() {
                _enabled = !_enabled;
              });
            },
            focusColor: Constant.green,
            activeColor:  Constant.green,
            activeTrackColor: Colors.black12,
          )
        ],
      ),
    );
  }

  Widget _datePicker() {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime(2030),
      onDateChanged: (value) {
      },
    );
  }

  goToNextPage() {
    _currentPage != 2
        ?_pageController.nextPage(duration: Duration(milliseconds: 100), curve: Curves.easeIn)
        : Navigator.pop(context);
  }

  Widget _nextButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: MyButton(buttonString: "Next step", action: goToNextPage,),
    );
  }
}
