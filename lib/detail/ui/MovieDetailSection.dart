

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moviedb/api/detail/MovieDetailCreditsResponse.dart';
import 'package:moviedb/api/detail/MovieDetailResponse.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import '../MovieDetailViewModel.dart';

enum DetailSectionIndex {
  rate, description, info, credits
}

extension DetailSectionIndexExtension on DetailSectionIndex {
  static final sort = {
    0: DetailSectionIndex.rate,
    1: DetailSectionIndex.description,
    3: DetailSectionIndex.info,
    2: DetailSectionIndex.credits,
  };

  static DetailSectionIndex of(int section) {
    return sort[section]!;
  }
}

class MovieDetailSection extends StatelessWidget {
  MovieDetailSection({Key? key, required this.index, required this.response, required this.overview, required this.size, required this.onTapCredits}) : super(key: key);

  int index;
  MovieDetailInfo response;
  String? overview;
  Size size;
  void Function(int) onTapCredits;

  @override
  Widget build(BuildContext context) {
    final section = DetailSectionIndexExtension.of(index);
    switch (section) {
      case DetailSectionIndex.rate:
        return _rate(response.detail);
      case DetailSectionIndex.description:
        return _description(response.detail, overview);
      case DetailSectionIndex.info:
        return _info(response.detail);
      case DetailSectionIndex.credits:
        return _credit(response.credits);
    }
    return Card(
      child: Container(
        padding: const EdgeInsets.all(8),

      ),
      color: Colors.white.withOpacity(0.8),
    );
  }

  Widget _rate(MovieDetailResponse detail) {
    final average = detail.voteAverage;
    if (average == null || average == 0) {
      return Container(height: 0);
    }
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(211, 211, 211, 1)),
            borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            SizedBox(
                height: 90,
                width: 90,
                child: _chartData(average)),
            const SizedBox(width: 40),
            Column(
              children: [
                const Text("???????????????????????????", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Container(padding: const EdgeInsets.fromLTRB(8, 0, 0, 0), child: Text("(${detail.voteCount}???)", style: const TextStyle(fontSize: 12))),
                const SizedBox(height: 16),
                Text(detail.releaseDate != null ? "${detail.releaseDate} ??????" : "-", style: const TextStyle(fontSize: 12))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _chartData(double voteAverage) {
    final _series = charts.Series<BudgetChart, String>(
      id: "BudegetChart",
      domainFn: (BudgetChart record, _) => record.word,
      measureFn: (BudgetChart record, _) => record.money,
      colorFn: (BudgetChart record, _) => record.color,
      data: [
        BudgetChart("${voteAverage*10}%", voteAverage*10, charts.MaterialPalette.green.shadeDefault),
        BudgetChart("", (10-voteAverage)*10, const charts.Color(r: 0, g: 0, b: 0, a: 16)),
      ]
    );
    return charts.PieChart<String>(
        [_series],
        animate: false,
        layoutConfig: charts.LayoutConfig(
            leftMarginSpec: charts.MarginSpec.fixedPixel(1),
            topMarginSpec: charts.MarginSpec.fixedPixel(1),
            rightMarginSpec: charts.MarginSpec.fixedPixel(1),
            bottomMarginSpec: charts.MarginSpec.fixedPixel(1)
        ),
        defaultRenderer: charts.ArcRendererConfig(strokeWidthPx: 0, arcRendererDecorators: [charts.ArcLabelDecorator()])
    );
  }

  Widget _description(MovieDetailResponse detail, String? overview) {
    if (overview == null || overview.isEmpty) {
      return Container(height: 0);
    }

    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(211, 211, 211, 1)),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Wrap(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Text(overview,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 10,
              ),
              const SizedBox(height: 10),
            ],
          ),
        ],)
      ),
    );
  }

  Widget _credit(MovieDetailCreditsResponse credit) {
    final casts = credit.cast?.take(10).toList();
    if (casts == null || casts.isEmpty) {
      return Container(height: 0);
    }

    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Container(
          // padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(211, 211, 211, 1)),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                child: const Text("?????????", style: TextStyle(color: Colors.white)),
                color: Colors.black45,
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 182,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      child: _creditItem(casts[index]),
                      onTap: () {
                        final id = casts[index].id;
                        if (id == null) { return;}
                        onTapCredits(id);
                      },
                    );
                  },
                  itemCount: casts.length,
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 10)
                ),
              )
            ],
          )
    ));
  }

  Widget _creditItem(Cast cast) {
    final image = cast.profilePath != null
        ? CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/original/${cast.profilePath}',
            errorWidget: (context, url, error) => const Icon(Icons.error),
            width: 90,
            height: 120,
            fit: BoxFit.fitWidth,
          )
        : const SizedBox(
            width: 90, child: Image(image: AssetImage("images/noImage.png")));
    return Container(
        // padding: EdgeInsets.all(6),
        height: 170,
        width: 90,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(211, 211, 211, 1)),
            borderRadius: BorderRadius.circular(6)),
        child: Column(
          children: [
            image,
            const SizedBox(height: 8),
            Expanded(
                child: Text(
              "${cast.name}",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ))
          ],
        ));
  }

  Widget _info(MovieDetailResponse detail) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromRGBO(211, 211, 211, 1)),
          borderRadius: BorderRadius.circular(6),
        ),
        height: 400,
      ),
    );
  }
}

// ?????????????????????
class BudgetChart {
  final String word;
  final double? money;
  final charts.Color color;

  BudgetChart(this.word, this.money, this.color);
}