import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:places_api/places_api.dart';
import 'package:sarya/search_places/sarya_map.dart';
import 'package:sarya/search_places/sarya_search_feild.dart';
import 'package:sarya/search_places/sarya_spacing.dart';
import 'package:sarya/search_places/sarya_text.dart';
import 'package:sarya/theme/color_scheme.dart';

import '../helper/helper_methods.dart';
import 'Sarya_color.dart';
import 'sarya_chip.dart';

class PlacesSearchModal extends StatefulWidget {
  const PlacesSearchModal({
    Key? key,
    required this.passedContext,
    required this.modalContext,
    required this.title,
    required this.signleSearch,
    required this.onPlaceSelected,
  }) : super(key: key);

  final BuildContext passedContext;
  final BuildContext modalContext;
  final String title;
  final Function(List<Place>?) onPlaceSelected;
  final bool? signleSearch;

  @override
  _PlacesSearchModalState createState() => _PlacesSearchModalState();
}

class _PlacesSearchModalState extends State<PlacesSearchModal> {
  GoogleMapController? _googleMapController;
  BitmapDescriptor? flagIcon;

  @override
  void initState() {

    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(
        size: Size(20, 20),
      ),
      'lib/assets/svgs/flag_icon.png',
    ).then((onValue) {
      flagIcon = onValue;
      setState(() {});
    });
    super.initState();
  }



  List<Place> list_of_all_selected_places = [];
  var markers = <MarkerId, Marker>{};
  void _goToPlace(Place place) {
    if (widget.signleSearch!) {
      widget.onPlaceSelected.call([place]);
    } else {
      list_of_all_selected_places.add(place);
      widget.onPlaceSelected.call(list_of_all_selected_places);
    }
    if (_googleMapController != null) {
      if (widget.signleSearch!) {
        final markerIdVal =
            'marker_id_${place.geometry.location.lat}_${place.geometry.location.lng}';
        final markerId = MarkerId(markerIdVal);
        final marker = Marker(
          markerId: markerId,
          position:
              LatLng(place.geometry.location.lat, place.geometry.location.lng),
          icon: flagIcon!,
        );
        markers[markerId] = marker;
        setState(() {});
      } else {
        markers.clear();
        list_of_all_selected_places.forEach((element) {
          final markerIdVal =
              'marker_id_${element.geometry.location.lat}_${element.geometry.location.lng}';
          final markerId = MarkerId(markerIdVal);
          final marker = Marker(
            markerId: markerId,
            position: LatLng(
                element.geometry.location.lat, element.geometry.location.lng),
            icon: flagIcon!,
          );
          final iceGiants = {markerId: marker};
          markers.addEntries(iceGiants.entries);
        });
        setState(() {});
      }
      _googleMapController!.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(
              place.geometry.location.lat,
              place.geometry.location.lng,
            ),
            zoom: 14.0,
          ),
        ),
      );
    }
  }

  void searchPlace(String searchString) async {
    final placesApi = PlacesApi();
    searchResults = await placesApi.getAutocomplete(searchString);
    print('${searchResults.length}');
    setState(() {});
  }

  List<PlaceSearch> searchResults = [];
  List<PlaceSearch> selected_places = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: SaryaColors.appbar,
        leading:   IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios, color: AppColor.lightIndigo,)),
        title: SaryaText(
          text: widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
        ),

      ),
      body: Column(
        children: [
          Container(
            color: SaryaColors.appbar,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: SaryaSpacing.base),
                  child: Image.asset(
                    'lib/assets/svgs/search_field_icon.png',
                    height: 30.0,
                    width: 30.0,
                  ),
                ),
                Expanded(
                  child: SaryaSearchField(
                    onChanged: searchPlace,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
            child: flagIcon == null
                ? SizedBox()
                : Builder(builder: (c) {
                    return flagIcon != null
                        ? SaryaMap(
                            defaultPosition: LatLng(CurrentLocation.lat, CurrentLocation.lng),
                            onMapCreated: (controller) {
                              _googleMapController = controller;
                            },
                            markers: markers,
                          )
                        : const SizedBox();
                  }),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: SaryaSpacing.medium,
              ),
              child: Wrap(
                spacing: SaryaSpacing.medium,
                children: selected_places
                    .map(
                      (result) => SaryaChip(
                        label: result.description,
                        onDeleted: () {
                          selected_places.remove(result);
                          setState(() {});
                          if (widget.signleSearch!) {
                            widget.onPlaceSelected.call(null);
                          } else {
                            widget.onPlaceSelected
                                .call(list_of_all_selected_places);
                          }
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: ModalScrollController.of(widget.modalContext),
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: SaryaText(
                    text: searchResults[index].description,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  onTap: () async {
                    if (widget.signleSearch!) {
                      selected_places = [searchResults[index]];
                    } else {
                      selected_places.add(searchResults[index]);
                    }
                    setState(() {});
                    final placesApi = PlacesApi();
                    final response =
                        await placesApi.getPlace(searchResults[index].placeId);
                    _goToPlace(response);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }
}
