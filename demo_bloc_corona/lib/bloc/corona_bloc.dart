import 'package:demo_bloc_corona/data_provider/corona_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState>{
  final _apiCorona= CoronaApi();

  @override
  // TODO: implement initialState
  CoronaState get initialState => CoronaLoading();

  @override
  Stream<CoronaState> mapEventToState(CoronaEvent event) async*{
    if(event is FetchCoronaData){
      yield CoronaLoading();
      try {
        final corona = await _apiCorona.getCountList();
        yield CoronaLoaded(coronaData: corona);
      }catch(e){
        yield CoronaError();
      }
    }
  }

}