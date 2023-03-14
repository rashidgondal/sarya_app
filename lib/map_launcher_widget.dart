import 'package:map_launcher/map_launcher.dart';

openGoogleMap(double lat, double lng) async {
  bool? result = await MapLauncher.isMapAvailable(MapType.apple);
  if (result!) {
    await MapLauncher.showMarker(
      mapType: MapType.apple,
      coords: Coords(lat, lng),
      title: '',
      description: '',
    );
  }
}
