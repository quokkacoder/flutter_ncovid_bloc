import 'package:demo_bloc_corona/bloc/bloc.dart';
import 'package:demo_bloc_corona/bloc/corona_bloc.dart';
import 'package:demo_bloc_corona/model/country.dart';
import 'package:demo_bloc_corona/views/has_data/children/overall.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'children/detail.dart';

class HasCoronaData extends StatelessWidget {
  final CountCountry _world;

  HasCoronaData(this._world);

  CoronaBloc _coronaBloc;

  @override
  Widget build(BuildContext context) {
    _coronaBloc = BlocProvider.of<CoronaBloc>(context);

    return RefreshIndicator(
      onRefresh: ()async{
        _coronaBloc.add(FetchCoronaData());
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _header(),
            Divider(
              color: Colors.blue[900],
            ),
            SizedBox(
              height: 8,
            ),
            overall(_world),
            SizedBox(
              height: 16,
            ),
            detail(_world),
          ],
        ),
      ),
    );
  }

  _header() {
    final widget = Text(
      'COVID-19 CORONAVIRUS PANDEMIC',
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue[900]),
    );
    return widget;
  }

}
