import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../MovieDBApp.dart';
import 'MovieListViewModel.dart';

class ListItem extends StatelessWidget {
  ListItem({Key? key, required this.item}) : super(key: key);

  MovieListItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 8),
      child: Container(
        height: 135,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromRGBO(211, 211, 211, 1)),
            borderRadius: BorderRadius.circular(6),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                spreadRadius: 1.0,
                blurRadius: 6.0,
                offset: Offset(0, 0),
              ),
            ]),
        child: Container(
            color: textColor,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                    child: item.posterPath != null
                        ? CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/original/${item.posterPath}',
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            width: 110,
                          )
                        : const Image(image: AssetImage("images/noImage.png")),
                    flex: 10),
                // const SizedBox(width: 10),
                Flexible(child: Container(),flex: 1,),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text(
                        item.title ?? "-",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      Visibility(
                        child: Text(
                            item.releaseDate != null ? item.releaseDate! : "-",
                            style: const TextStyle(
                                color: Color.fromRGBO(99, 99, 99, 1),
                                fontSize: 13,
                                fontWeight: FontWeight.bold)),
                        visible: item.releaseDate != null,
                      ),
                      const SizedBox(height: 10),
                      Visibility(
                        child: Expanded(
                            child: Text(
                          item.overview ?? "-",
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        )),
                        visible: item.overview != null,
                      )
                    ],
                  ),
                  flex: 30,
                )
              ],
            )),
      ),
    );
  }
}
