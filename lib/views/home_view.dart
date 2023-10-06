import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../services/api.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meme Verse'),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: API.getMemes(),
          builder: (context, snapshot) {
            if(snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data!.data!.memes!.length,
                itemBuilder:  (context, index) {
                  final meme = snapshot.data!.data!.memes![index];
                  return InkWell(
                    onTap: () => launchUrl(Uri.parse(meme.url!)),
                    child: Card(
                      child: Stack(
                        children: [
                          GridTile(
                            header: CachedNetworkImage(
                              imageUrl: meme.url!,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => const SizedBox.shrink(
                                  child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                            footer: Text(meme.name!),
                            child: Text(meme.url!),
                          ),
                        ],
                      ),
                    ),
                  );},
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
      ),
    );
  }
}
