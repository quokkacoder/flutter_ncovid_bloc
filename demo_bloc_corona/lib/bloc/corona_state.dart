
import 'package:demo_bloc_corona/model/country.dart';
import 'package:equatable/equatable.dart';

class CoronaState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class CoronaLoading extends CoronaState{}

class CoronaLoaded extends CoronaState{
  final List<CountCountry> coronaData;

  CoronaLoaded({this.coronaData}) : assert(coronaData!=null);

  @override
  // TODO: implement props
  List<Object> get props => [coronaData];
}

class CoronaError extends CoronaState{}