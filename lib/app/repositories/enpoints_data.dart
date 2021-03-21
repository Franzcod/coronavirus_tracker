import 'package:covid_tracker/app/services/api.dart';
import 'package:covid_tracker/app/services/enpoint_data.dart';
import 'package:flutter/foundation.dart';

class EndpointsData {
  final Map<Endpoint, EndpointData> values;

  EndpointsData({@required this.values});

  EndpointData get cases => values[Endpoint.cases];
  EndpointData get casesSuspected => values[Endpoint.casesSuspected];
  EndpointData get casesConfirmed => values[Endpoint.casesConfirmed];
  EndpointData get deaths => values[Endpoint.deaths];
  EndpointData get recovered => values[Endpoint.recovered];

  @override
  String toString() =>
      'Cases: $cases,\nSuspected: $casesSuspected, \nConfirmed: $casesConfirmed,\nDeaths: $deaths,\nRecovered: $recovered ';
}
