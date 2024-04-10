import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

import 'package:favorite_places/models/place.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key, required this.onSelectLocation});

  final void Function(PlaceLocation location) onSelectLocation;

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocation? _pickedPosition;
  var _isGettingLocation = false;

  String get locationImage {
    if (_pickedPosition == null) {
      return '';
    }
    final lat = _pickedPosition!.latitude;
    final lng = _pickedPosition!.longitude;

    // return image from google maps static api using lat & lng
    return 'https://source.unsplash.com/random/300x300/?map ${DateTime.now().millisecondsSinceEpoch.toString()}';
  }

  Future<void> _savePlace(double lat, double lng) async {
    final url = Uri.parse(
        'https://geocode.maps.co/reverse?lat=$lat&lon=$lng&api_key=66098f4105ed8366566642euscfb3d3');
    final response = await http.get(url);
    final resData = json.decode(response.body);
    final address = resData['display_name'];

    setState(() {
      _pickedPosition = PlaceLocation(
        latitude: lat,
        longitude: lng,
        address: address,
      );
      _isGettingLocation = false;
    });
    widget.onSelectLocation(_pickedPosition!);
  }

  void _getCurrentLocation() async {
    LocationPermission permission;
    Position? position;

    bool serviceEnabled = false;
    if (Platform.isAndroid) {
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.',
        );
      }
    }

    setState(() {
      _isGettingLocation = true;
    });
    if (Platform.isWindows) {
      await Future.delayed(const Duration(seconds: 1));
      position = Position(
        longitude: 78.1539705,
        latitude: 8.816212,
        timestamp: DateTime.now(),
        accuracy: 0.0,
        altitude: 0.0,
        altitudeAccuracy: 0.0,
        heading: 0.0,
        headingAccuracy: 0.0,
        speed: 0.0,
        speedAccuracy: 0.0,
      );
    } else if (Platform.isAndroid) {
      position = await Geolocator.getCurrentPosition();
    }
    // else {
    //   return Future.error('Invalid platform.');
    // }

    if (position == null) {
      return;
    }

    final lat = position.latitude;
    final lng = position.longitude;
    _savePlace(lat, lng);
    // final url = Uri.parse(
    //     'https://geocode.maps.co/reverse?lat=$lat&lon=$lng&api_key=66098f4105ed8366566642euscfb3d3');
    // final response = await http.get(url);
    // final resData = json.decode(response.body);
    // final address = resData['display_name'];

    // setState(() {
    //   _pickedPosition = PlaceLocation(
    //     latitude: lat,
    //     longitude: lng,
    //     address: address,
    //   );
    //   _isGettingLocation = false;
    // });
    // widget.onSelectLocation(_pickedPosition!);
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No location chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
    );

    if (_pickedPosition != null) {
      previewContent = Image.network(
        locationImage,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    }
    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: previewContent,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              icon: const Icon(Icons.location_on),
              label: const Text('Get Current Location'),
              onPressed: _getCurrentLocation,
            ),
            TextButton.icon(
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
              onPressed: () {},
            ),
          ],
        )
      ],
    );
  }
}
