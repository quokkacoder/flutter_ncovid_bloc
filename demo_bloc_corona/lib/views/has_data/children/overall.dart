import 'package:demo_bloc_corona/model/country.dart';
import 'package:flutter/material.dart';

overall(CountCountry world) {
  return Container(
    height: 100,
    child: ListView(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _itemOverall(world.cases, 'Cases', Colors.blue),
        _itemOverall(world.deaths, 'Deaths', Colors.red),
        _itemOverall(world.recovered, 'Recoverd', Colors.green),
      ],
    ),
  );
}

_itemOverall(int data, String title, Color color) {
  return SizedBox(
    width: 110,
    child: Card(
      elevation: 5,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              data.toString(),
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    ),
  );
}