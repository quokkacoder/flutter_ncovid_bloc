import 'package:equatable/equatable.dart';

class CountCountry extends Equatable{
  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int mildCondition;
  int active;
  int critical;
  int closedCase;
  String ratioMildCondition;
  String ratioRecovered;
  String ratioCritical;
  String ratioDeaths;

  CountCountry.fromJson(Map<String, dynamic> json){
    country = json['country'];
    cases = json['cases'];
    todayCases = json['todayCases'];
    deaths = json['deaths'];
    todayDeaths = json['todayDeaths'];
    recovered = json['recovered'];
    active = json['active'];
    critical = json['critical'];
    //// custom property ////
    mildCondition = active - critical; // Mild Condition
    closedCase = deaths + recovered; // All Closed Case
    ratioMildCondition= (mildCondition / active * 100).toStringAsFixed(2); // ratio Mild Condition per Active
    ratioRecovered= (recovered / closedCase * 100).toStringAsFixed(2); // ratio Recovered per Closed Case
    ratioCritical= (critical / active * 100).toStringAsFixed(2); // ratio Critical Condition per Active
    ratioDeaths= (deaths / closedCase * 100).toStringAsFixed(2); // ratio Deaths per Closed Case
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['cases'] = this.cases;
    data['todayCases'] = this.todayCases;
    data['deaths'] = this.deaths;
    data['todayDeaths'] = this.todayDeaths;
    data['recovered'] = this.recovered;
    data['active'] = this.active;
    data['critical'] = this.critical;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [country, cases, todayCases, deaths, todayDeaths, recovered, active, critical];

  @override
  // TODO: implement stringify
  bool get stringify => true;
}