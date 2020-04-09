import 'package:demo_bloc_corona/model/country.dart';
import 'package:flutter/material.dart';

detail(CountCountry world) {
  final widget = Column(
    children: <Widget>[
      _activeCard(world),
      SizedBox(
        height: 16,
      ),
      _closedCard(world),
    ],
  );

  return widget;
}

_activeCard(CountCountry world) {
  final card = Card(
    elevation: 5,
    child: Column(
      children: <Widget>[
        _title('ACTIVE CASES'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    world.active.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Currently Infected Patients')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            world.mildCondition.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                          SizedBox(width: 4,),
                          Text('(${world.ratioMildCondition}%)',  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Text('in Mild Condition')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            world.critical.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                          ),
                          SizedBox(width: 4,),
                          Text('(${world.ratioCritical}%)',  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Text('Serious or Critica')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),

      ],
    ),
  );

  return card;
}

_closedCard(CountCountry world) {
  final card = Card(
    elevation: 5,
    child: Column(
      children: <Widget>[
        _title('CLOSED CASES'),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    world.closedCase.toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Cases which had an outcome')
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            world.recovered.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
                          ),
                          SizedBox(width: 4,),
                          Text('(${world.ratioRecovered}%)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Text('Recovered')
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            world.deaths.toString(),
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                          SizedBox(width: 4,),
                          Text('(${world.ratioDeaths}%)',  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                        ],
                      ),
                      Text('Deaths')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),

      ],
    ),
  );

  return card;
}

_title(String title) {
  return Container(
    color: Colors.grey[300],
    alignment: Alignment.center,
    child: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
    height: 40,
  );
}

