import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Caveat',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Caveat',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldInputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    icon: Icon(
      Icons.location_city,
      color: Colors.white,
    ),
    hintStyle: TextStyle(
        color: Colors.grey
    ),
    hintText: 'Enter City Name',
    border:OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)),
      borderSide: BorderSide.none,
    )
);