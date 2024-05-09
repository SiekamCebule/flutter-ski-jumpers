// ignore_for_file: avoid_print

import 'package:intl/intl.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as parser;

var formatter = DateFormat('dd-MM-yyyy');

class Apperance {
  Apperance({
    required this.date,
    required this.hill,
    required this.competitionType,
    required this.position,
    required this.distances,
  });
  DateTime date;
  String hill;
  String competitionType;
  int position;
  List<double> distances;

  String get formattedDate {
    return formatter.format(date);
  }
}

bool isCompetitionTypeValid(List<String> allowedTypes, String type) {
  if (allowedTypes.isEmpty) {
    return true;
  }

  for (var str in allowedTypes) {
    if (str.contains(type)) {
      return true;
    }
  }

  return false;
}

void addDistance(List<double> distances, String data) {
  if (data == 'DSQ') {
    distances.add(-1);
  } else if (data == 'DNS') {
    distances.add(-2);
  } else if (data.isNotEmpty && data != '&nbsp') {
    distances.add(double.parse(data.replaceAll(',', '.')));
  } else {
    distances.add(-3);
  }
}

Future<List<Apperance>> loadJumperApperances(
    SkiJumper jumper, int count, List<String> competitionTypes) async {
  List<Apperance> apperances = [];
  var response = await http.get(Uri.parse(
      'http://www.wyniki-skoki.hostingasp.pl/Zawodnik.aspx?name=${jumper.surname.toUpperCase()}%20${jumper.name}'));
  if (response.statusCode == 200) {
    var document = parser.parse(response.body);
    var generalData =
        document.querySelector('#ctl00_MainContent_gvKonkursyMie > tbody');
    int i = 0;
    var trs = generalData!.querySelectorAll('tr');
    print('ct ${trs.length}');
    for (var tr in trs) {
      if (i == 0) {
        i++;
        continue;
      }
      if (apperances.length == count) {
        break;
      }
      DateFormat format = DateFormat("yyyy.MM.dd");
      var columns = tr.querySelectorAll('td');
      String competitionType = columns[10].text;
      if (isCompetitionTypeValid(competitionTypes, competitionType) == false) {
        i++;
        continue;
      }
      DateTime date = format.parse(columns[0].text.replaceAll(',', '.'));
      String hill = columns[1].text;
      if (hill == 'Garmisch-Partenkirchen') {
        hill = 'Ga-Pa';
      }
      int position = int.tryParse(columns[3].text) ?? 0;
      List<double> distances = [];

      addDistance(distances, columns[4].text.trim());
      addDistance(distances, columns[5].text.trim());
      addDistance(distances, columns[6].text.trim());
      addDistance(distances, columns[7].text.trim());

      apperances.add(
        Apperance(
          date: date,
          hill: hill,
          competitionType: competitionType,
          position: position,
          distances: distances,
        ),
      );
      i++;
    }
  } else {
    print("NIE UDAŁO SIĘ POBRAĆ DANYCH!");
  }

  return apperances;
}
