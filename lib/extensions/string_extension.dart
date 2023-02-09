extension AppString on String {
  String get png => 'lib/assets/svgs/$this.png';
  String get jpg => 'lib/assets/svgs/$this.jpg';
  String get svg => 'lib/assets/svgs/$this.svg';
  String get gifs => 'lib/assets/giffs/$this.gif';
  String get geojson => 'lib/assets/json_data/$this.geojson';
}
