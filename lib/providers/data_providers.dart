// ignore_for_file: avoid_print

import 'package:ski_jumpers/models/country.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ski_jumpers/models/ski_jumper.dart';

var countriesProvider = Provider(
  (ref) => const [
    Country(name: 'Polska', code: 'pl'),
    Country(name: 'Niemcy', code: "de"),
    Country(name: 'Norwegia', code: "no"),
    Country(name: 'Austria', code: "at"),
    Country(name: 'Słowenia', code: "si"),
    Country(name: 'Japonia', code: "jp"),
    Country(name: 'Szwajcaria', code: "ch"),
    Country(name: 'Finlandia', code: "fi"),
    Country(name: 'Włochy', code: "it"),
    Country(name: 'Kanada', code: "ca"),
    Country(name: 'Estonia', code: "ee"),
  ],
);

Country countryByCode(List<Country> countries, String code) {
  print('country by code');
  Country c = countries.firstWhere((element) => element.code == code);
  print('ccountry by code działą!');
  print('cc ${c.code}');
  return c;
}

var jumpersProvider = Provider(
  (ref) {
    var countries = ref.watch(countriesProvider);

    // Sprawdź, czy lista krajów nie jest pusta
    if (countries.isEmpty) {
      // Możesz tutaj obsłużyć sytuację, gdy lista krajów jest pusta.
      // Na przykład, zwracając pustą listę skoczków, logując błąd, itp.
      print("Lista krajów jest pusta");
      return <SkiJumper>[];
    }

    var toReturn = [
      SkiJumper(
        name: 'Karl',
        surname: 'Geiger',
        country: countryByCode(countries, 'de'),
        birthdate: DateTime(1993, 2, 11),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Markus',
        surname: 'Eisenbichler',
        country: countryByCode(countries, 'de'),
        birthdate: DateTime(1991, 4, 3),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Andreas',
        surname: 'Wellinger',
        country: countryByCode(countries, 'de'),
        birthdate: DateTime(1995, 8, 28),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Stephan',
        surname: 'Leyhe',
        country: countryByCode(countries, 'de'),
        birthdate: DateTime(1992, 1, 5),
        hasIndWCPodium: true,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Constantin',
        surname: 'Schmid',
        country: countryByCode(countries, 'de'),
        birthdate: DateTime(1999, 11, 27),
        hasIndWCPodium: true,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Justin',
        surname: 'Lisso',
        country: countryByCode(countries, 'de'),
        birthdate: DateTime(1999, 12, 12),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Killian',
        surname: 'Peier',
        country: countryByCode(countries, 'ch'),
        birthdate: DateTime(1995, 3, 28),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Simon',
        surname: 'Ammann',
        country: countryByCode(countries, 'ch'),
        birthdate: DateTime(1981, 6, 25),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Gregor',
        surname: 'Deschwanden',
        country: countryByCode(countries, 'ch'),
        birthdate: DateTime(1991, 2, 27),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Ryoyu',
        surname: 'Kobayashi',
        country: countryByCode(countries, 'jp'),
        birthdate: DateTime(1996, 11, 8),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Ren',
        surname: 'Nikaido',
        country: countryByCode(countries, 'jp'),
        birthdate: DateTime(2001, 5, 24),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Halvor Egner',
        surname: 'Granerud',
        country: countryByCode(countries, 'no'),
        birthdate: DateTime(1996, 5, 29),
        hasIndWCPodium: true,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Daniel Andre',
        surname: 'Tande',
        country: countryByCode(countries, 'no'),
        birthdate: DateTime(1994, 1, 24),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Marius',
        surname: 'Lindvik',
        country: countryByCode(countries, 'no'),
        birthdate: DateTime(1998, 6, 27),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Johann Andre',
        surname: 'Forfang',
        country: countryByCode(countries, 'no'),
        birthdate: DateTime(1995, 7, 4),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Robert',
        surname: 'Johansson',
        country: countryByCode(countries, 'no'),
        birthdate: DateTime(1990, 3, 23),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Sondre',
        surname: 'Ringen',
        country: countryByCode(countries, 'no'),
        birthdate: DateTime(1996, 10, 9),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Mackenzie',
        surname: 'Boyd-Clowes',
        country: countryByCode(countries, 'ca'),
        birthdate: DateTime(1991, 7, 13),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Piotr',
        surname: 'Żyła',
        country: countryByCode(countries, 'pl'),
        birthdate: DateTime(1987, 1, 16),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Dawid',
        surname: 'Kubacki',
        country: countryByCode(countries, 'pl'),
        birthdate: DateTime(1990, 3, 12),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Kamil',
        surname: 'Stoch',
        country: countryByCode(countries, 'pl'),
        birthdate: DateTime(1987, 5, 25),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Jakub',
        surname: 'Wolny',
        country: countryByCode(countries, 'pl'),
        birthdate: DateTime(1995, 5, 15),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Maciej',
        surname: 'Kot',
        country: countryByCode(countries, 'pl'),
        birthdate: DateTime(1991, 6, 9),
        hasIndWCPodium: true,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Aleksander',
        surname: 'Zniszczoł',
        country: countryByCode(countries, 'pl'),
        birthdate: DateTime(1994, 3, 8),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Andrzej',
        surname: 'Stękała',
        country: countryByCode(countries, 'pl'),
        birthdate: DateTime(1995, 6, 30),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Paweł',
        surname: 'Wąsek',
        country: countryByCode(countries, 'pl'),
        birthdate: DateTime(1999, 6, 2),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Artti',
        surname: 'Aigro',
        country: countryByCode(countries, 'ee'),
        birthdate: DateTime(1999, 8, 26),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Stefan',
        surname: 'Kraft',
        country: countryByCode(countries, 'at'),
        birthdate: DateTime(1993, 5, 13),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Manuel',
        surname: 'Fettner',
        country: countryByCode(countries, 'at'),
        birthdate: DateTime(1991, 6, 9),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Philipp',
        surname: 'Aschenwald',
        country: countryByCode(countries, 'at'),
        birthdate: DateTime(1995, 11, 12),
        hasIndWCPodium: true,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Ulrich',
        surname: 'Wohlgennant',
        country: countryByCode(countries, 'at'),
        birthdate: DateTime(1994, 8, 1),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Daniel',
        surname: 'Tschofenig',
        country: countryByCode(countries, 'at'),
        birthdate: DateTime(2002, 3, 28),
        hasIndWCPodium: true,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Domen',
        surname: 'Prevc',
        country: countryByCode(countries, 'si'),
        birthdate: DateTime(1999, 6, 4),
        hasIndWCPodium: true,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Ziga',
        surname: 'Jelar',
        country: countryByCode(countries, 'si'),
        birthdate: DateTime(1997, 10, 22),
        hasIndWCPodium: true,
        hasIndMedal: false,
      ),
      SkiJumper(
        name: 'Timi',
        surname: 'Zajc',
        country: countryByCode(countries, 'si'),
        birthdate: DateTime(2000, 4, 26),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Peter',
        surname: 'Prevc',
        country: countryByCode(countries, 'si'),
        birthdate: DateTime(1992, 9, 20),
        hasIndWCPodium: true,
        hasIndMedal: true,
      ),
      SkiJumper(
        name: 'Giovanni',
        surname: 'Bresadola',
        country: countryByCode(countries, 'it'),
        birthdate: DateTime(2001, 2, 17),
        hasIndWCPodium: false,
        hasIndMedal: false,
      ),
    ];
    return toReturn;
  },
);
