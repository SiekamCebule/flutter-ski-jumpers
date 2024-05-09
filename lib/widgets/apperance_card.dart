import 'package:flutter/material.dart';
import 'package:ski_jumpers/models/apperance.dart';

class ApperanceCard extends StatelessWidget {
  const ApperanceCard({super.key, required this.apperance});

  final Apperance apperance;

  @override
  Widget build(BuildContext context) {
    final typeRow = Row(
      children: [
        const Icon(
          Icons.emoji_events,
          size: 11,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 1)),
        Text(
          apperance.competitionType,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
    final placeRow = Row(
      children: [
        const Icon(
          Icons.place,
          size: 11,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 1)),
        Text(
          apperance.hill,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
    final dateRow = Row(
      children: [
        const Icon(
          Icons.calendar_month,
          size: 11,
        ),
        const Padding(padding: EdgeInsets.symmetric(horizontal: 1)),
        Text(
          apperance.formattedDate,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
    final distancesGrid = Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (1 / .3),
        ),
        itemCount: apperance.distances.length,
        itemBuilder: (context, index) {
          String dstText = '';
          switch (double.parse(apperance.distances[index].toString())) {
            case -3:
              dstText = '';
            case -2:
              dstText = 'DNS';
            case -1:
              dstText = 'DSQ';
            default:
              dstText = '${apperance.distances[index]}m';
          }
          return Container(
            alignment: Alignment.center,
            child: Text(
              dstText,
              style: Theme.of(context).textTheme.labelMedium,
              softWrap: false,
              overflow: TextOverflow
                  .visible, // Pozwala na wyjście tekstu poza komórkę
            ),
          );
        },
      ),
    );
    var positionText = Text(
      apperance.position > 0 ? '${apperance.position}' : 'NS',
      style: Theme.of(context)
          .textTheme
          .headlineSmall!
          .copyWith(color: Theme.of(context).colorScheme.secondary),
    );

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MediaQuery.of(context).size.width >= 600
            ? Column(
                children: [
                  Row(
                    children: [
                      positionText,
                      const Spacer(),
                      Column(
                        children: [typeRow, placeRow, dateRow],
                      ),
                    ],
                  ),
                  const Spacer(),
                  distancesGrid,
                  const Spacer(),
                ],
              )
            : Row(
                children: [
                  positionText,
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
                  distancesGrid,
                  const Padding(padding: EdgeInsets.symmetric(horizontal: 7)),
                  Column(
                    children: [typeRow, placeRow, dateRow],
                  ),
                ],
              ),
      ),
    );
  }
}
