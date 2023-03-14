import 'package:map_launcher/map_launcher.dart';

openGoogleMap(double lat, double lng) async {
  bool? result = await MapLauncher.isMapAvailable(MapType.google);
  if (result!) {
    await MapLauncher.showMarker(
      mapType: MapType.google,
      coords: Coords(lat, lng),
      title: 'L',
      description: 'L',
    );
  }
}
