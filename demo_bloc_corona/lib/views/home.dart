import 'package:demo_bloc_corona/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'error_widget.dart';
import 'has_data/has_data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: BlocBuilder<CoronaBloc, CoronaState>(
        builder: (context, state) {
          if (state is CoronaError) {
            return HomeErrorWidget();
          } else if (state is CoronaLoaded) {
            final c =
                state.coronaData.where((c) => c.country == 'World').toList();
            return HasCoronaData(c[0]);
          }

          return Center(child: CircularProgressIndicator());
        },
      )),
    );
  }
}
