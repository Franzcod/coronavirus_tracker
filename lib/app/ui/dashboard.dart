import 'dart:io';

import 'package:covid_tracker/app/repositories/data_repository.dart';
import 'package:covid_tracker/app/repositories/enpoints_data.dart';
import 'package:covid_tracker/app/services/api.dart';
import 'package:covid_tracker/app/ui/endpoint_card.dart';
import 'package:covid_tracker/app/ui/last_updated_status_text.dart';
import 'package:covid_tracker/app/ui/row_cuidados.dart';
import 'package:covid_tracker/app/ui/show_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  EndpointsData _endpointData;

  @override
  void initState() {
    super.initState();
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    _endpointData = dataRepository.getAllEndpointsCacheData();
    _updateData();
  }

  Future<void> _updateData() async {
    try {
      final dataRespository =
          Provider.of<DataRepository>(context, listen: false);
      final endpointData = await dataRespository.getAllEndpointData();
      setState(() {
        _endpointData = endpointData;
      });
    } on SocketException catch (e) {
      showAlertDialog(
          context: context,
          title: 'No se reciben datos',
          content: 'Sin conexion a internet, intentelo mas tarde.\n\n $e',
          defaultActionText: 'Ok');
    } catch (e) {
      showAlertDialog(
        context: context,
        title: 'Hubo un Error',
        content: 'Contacta el soporte o intenta mas tarde.\n\n $e',
        defaultActionText: 'Ok',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final formatter = LastUpdateDateFormatter(
      lastUpdated: _endpointData != null
          ? _endpointData.values[Endpoint.cases]?.date
          : null,
    );
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: RefreshIndicator(
        color: Colors.black,
        backgroundColor: Colors.lightGreen,
        onRefresh: _updateData,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -(450 / 3),
              left: screenWidth - (450 / 1.5),
              child: Opacity(
                opacity: 0.35,
                child: Image.asset(
                  'assets/images/virus2.png',
                  width: 450,
                  height: 450,
                ),
              ),
            ),
            Positioned(
              bottom: -(450 / 3),
              right: screenWidth - (450 / 1.5),
              child: Opacity(
                opacity: 0.4,
                child: Image.asset(
                  'assets/images/virus3.png',
                  width: 450,
                  height: 450,
                ),
              ),
            ),
            ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 25, top: 20, right: 20),
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: Text(
                    'Coronavirus Tracker',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 25, top: 20, right: 20),
                  color: Colors.black38,
                  child: Text(
                    'Recuernda:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
                RowCuidados(),
                LastUpdatedStatusText(
                  text: formatter.lastUpdatedStatusText(),
                ),
                for (var endpoint in Endpoint.values)
                  EndpointCard(
                    endpoint: endpoint,
                    value: _endpointData != null
                        ? _endpointData.values[endpoint]?.value
                        : null,
                  ),
                TextButton.icon(
                    onPressed: () {
                      const url =
                          'https://www.who.int/es/health-topics/coronavirus#tab=tab_1';
                      _launchURL(url);
                    },
                    icon: Icon(Icons.info_outline),
                    label: Text(
                      'Mas informacion Oficial aqui.',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
