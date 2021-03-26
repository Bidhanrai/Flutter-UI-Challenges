import 'package:flutter/material.dart';
import 'package:flutter_ui_challenges/BookingPage.dart';
import 'package:flutter_ui_challenges/Constant.dart';
import 'package:flutter_ui_challenges/Widgets/MyBullets.dart';

class DetailPage extends StatefulWidget {

  final String name;
  final Color color;
  final String imageUrl;
  DetailPage({this.color, this.name, this.imageUrl});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  bool _makeUpVisibility = true;
  bool _hairstyleVisibility = false;
  bool _infoVisibility = true;

  bool _isExpanded = true;

  TextEditingController _dateTextController = TextEditingController();
  TextEditingController _timeTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
              ),
              _backButton(),
              _backgroundImage(),
              _artistName(),
            ],
          ),

          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))
              ),
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                children: <Widget>[
                  _circularButtons(),

                  SizedBox(height: 20),

                  Visibility(
                    maintainState: true,
                    visible: _makeUpVisibility,
                    child: Theme(
                      data: ThemeData().copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        title: Text("Makeup", style: TextStyle(color: Colors.grey[700]),),
                        trailing: _isExpanded
                            ? Icon(Icons.keyboard_arrow_up_rounded, color: widget.color,)
                            : Icon(Icons.keyboard_arrow_down_rounded, color: widget.color,),
                        childrenPadding: EdgeInsets.only(bottom: 10),
                        initiallyExpanded: true,
                        onExpansionChanged: (value) {
                          setState(() {
                            _isExpanded = value;
                          });
                        },
                        children: [
                          Row(
                            children: [
                              MyBullets(color: widget.color,),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text("Lips", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),),
                              ),
                              Text("Rs 150", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),)
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              MyBullets(color: widget.color,),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text("Eyes", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),),
                              ),
                              Text("Rs 300", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),)
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              MyBullets(color: widget.color,),
                              SizedBox(width: 10),
                              Expanded(
                                child: Text("Contour", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),),
                              ),
                              Text("Rs 150", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black54),)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _hairstyleVisibility,
                    maintainState: true,
                    child: Theme(
                      data: ThemeData().copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        //childrenPadding: EdgeInsets.only(bottom: 10),
                        title: Text("Hairstyle", style: TextStyle(color: Colors.grey[700]),),
                        trailing: Icon(Icons.keyboard_arrow_down_rounded, color: widget.color,),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  Text("Date & Time", style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                  SizedBox(height: 10,),
                  _dateTimeWidget(context),

                  SizedBox(height: 25,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Information", style: TextStyle(fontSize: 16, color: Colors.grey[700]),),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _infoVisibility = !_infoVisibility;
                          });
                        },
                        child: Text(
                          "Read info",
                          style: TextStyle(
                            fontSize: 12,
                            color: widget.color,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Visibility(
                    visible: _infoVisibility,
                    child: Text("I would like to introduce myself. my name is ${widget.name} and I am"
                        "a freelance makeup artist and hairdresser.\n\n",
                    style: TextStyle(fontSize: 12, wordSpacing: 1, height: 1.6),),
                  ),

                  SizedBox(height: 10,),

                  _dateTextController.text.length == 0 || _timeTextController.text.length == 0
                    ? SizedBox()
                      : RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Your booking will take about ",
                                style: TextStyle(color: Colors.black87),
                              ),
                              TextSpan(
                                text: "3 hours\n",
                                style: TextStyle(color: widget.color, fontWeight: FontWeight.w600)
                              )
                            ]
                          ),
                        ),
                  _bookingButton()
                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  Widget _backButton() {
    return Positioned(
      top: 30,
      left: 10,
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }

  Widget _backgroundImage() {
    return  Positioned(
      bottom: 0,
      right: 25,
      child: Hero(
        tag: widget.imageUrl,
        child: Image.asset(
          widget.imageUrl,
          height: MediaQuery.of(context).size.height * 0.25,
          // scale: 2.3,
        ),
      ),
    );
  }

  Widget _artistName() {
    return Positioned(
      bottom: 30,
      left: 25,
      child: Text(
        widget.name,
        style: TextStyle(
          fontFamily: "Playfair Display",
          color: Colors.white,
          fontSize: 35,
          letterSpacing: 1,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _circularButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _makeUpVisibility = !_makeUpVisibility;
            });
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Constant.pink,
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.house_rounded, color: Colors.white,),
              ),
              SizedBox(height: 8,),
              _makeUpVisibility ? MyBullets(color: Constant.pink,) : SizedBox(height: 5) ,
            ],
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              _hairstyleVisibility = !_hairstyleVisibility;
            });
          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Color(0XFFc19277),
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.house_rounded, color: Colors.white,),
              ),
              SizedBox(height: 8,),
              _hairstyleVisibility ? MyBullets(color: Color(0XFFc19277)) : SizedBox(height: 5) ,
            ],
          ),
        ),
        InkWell(
          onTap: () {

          },
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: Constant.skyBlue,
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.house_rounded, color: Colors.white,),
              ),
              SizedBox(height: 8,),
              SizedBox(height: 5,),
            ],
          ),
        ),
      ],
    );
  }

  Widget _dateTimeWidget(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey[400])]),
            child: TextField(
              style: TextStyle(color: widget.color),
              readOnly: true,
              controller: _dateTextController,
              onTap: () async{
                DateTime date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(DateTime.now().year - 1),
                  lastDate: DateTime(DateTime.now().year + 1),
                );

                if (date != null) {
                  final localizations = MaterialLocalizations.of(context);
                  final formattedTimeOfDay = localizations.formatMediumDate(date);

                  //this setState is for updating the Booking button
                  setState(() {
                    _dateTextController.text = "$formattedTimeOfDay";
                  });

                }
              },
              decoration: InputDecoration(
                hintText: "Select Date",
                hintStyle: TextStyle(color: Colors.grey[300]),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey[400])]),
            child: TextField(
              style: TextStyle(color: widget.color),
              controller: _timeTextController,
              readOnly: true,
              onTap: () async{
                TimeOfDay time = await showTimePicker(context: context, initialTime: TimeOfDay.now());

                if(time != null) {
                  final localizations = MaterialLocalizations.of(context);
                  final formattedTimeOfDay = localizations.formatTimeOfDay(time);

                  //this setState is for updating the Booking button
                  setState(() {
                    _timeTextController.text = "$formattedTimeOfDay";
                  });
                }
              },
              decoration: InputDecoration(
                hintText: "Select Time",
                hintStyle: TextStyle(color: Colors.grey[300]),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 20),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _bookingButton() {
    return TextButton(
      onPressed: _dateTextController.text.length == 0 || _timeTextController.text.length == 0
          ? null
          : () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (BuildContext context) => BookingPage()),
                ModalRoute.withName('/'),
              );
            },
      child: Text(
        "Booking",
        style: TextStyle(
            color: _dateTextController.text.length == 0 || _timeTextController.text.length == 0
              ? widget.color
              : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 12
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          _dateTextController.text.length == 0 || _timeTextController.text.length == 0
            ? widget.color.withOpacity(0.2)
            : Color(0XFF30475e),
        ),
      ),

    );
  }
}
