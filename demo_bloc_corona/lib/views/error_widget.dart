import 'package:demo_bloc_corona/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _coronaBloc = BlocProvider.of<CoronaBloc>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Đã xảy ra lỗi ! Hãy thử lại'),
          SizedBox(height: 10,),
          RaisedButton.icon(
            label: Text('Thử lại', style: TextStyle(color: Colors.white),),
            color: Colors.blue,
            icon: Icon(Icons.refresh, color: Colors.white,),
            onPressed: () =>   _coronaBloc.add(FetchCoronaData())
          ),
        ],
      ),
    );
  }
}
