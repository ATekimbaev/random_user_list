import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.model});

  final Results model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 90,
                  backgroundImage: NetworkImage(model.picture?.medium ?? ''),
                ),
              ),
              const SizedBox(height: 25),
              Text(
                '${model.name?.title} ${model.name?.first} ${model.name?.last}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 25),
              Text(
                'Location ${model.location?.country}  ${model.location?.city}  ${model.location?.street}',
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 25),
              IconButton(
                onPressed: () {
                  _launchUrl(
                      url:
                          'https://maps.google.com/?q=${model.location?.coordinates?.latitude},${model.location?.coordinates?.longitude}');
                },
                icon: const Icon(
                  Icons.location_on,
                  size: 25,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchUrl({required String url}) async {
    Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
