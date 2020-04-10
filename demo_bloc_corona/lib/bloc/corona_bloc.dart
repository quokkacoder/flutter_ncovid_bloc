import 'package:demo_bloc_corona/data_provider/corona_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';
import 'package:rxdart/rxdart.dart';

class CoronaBloc extends Bloc<CoronaEvent, CoronaState>{
  final _apiCorona= CoronaApi();

  @override
  // TODO: implement initialState
  CoronaState get initialState => CoronaLoading();

  @override
  Stream<CoronaState> transformEvents(Stream<CoronaEvent> events, Stream<CoronaState> Function(CoronaEvent) next) {
    // TODO: implement transformEvents
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 300)),
      next,
    );
  }

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