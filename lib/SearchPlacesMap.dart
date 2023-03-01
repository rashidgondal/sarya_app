// import 'package:common/common.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
// import 'package:places_api/places_api.dart';
// import 'package:sarya/create_itinerary/cubit/create_itinerary_cubit.dart';
// import 'package:sarya/create_itinerary/view/widgets/location_selector.dart';
// import 'package:sarya/create_itinerary/view/widgets/places_search_modal.dart';
// import 'package:sarya_ui/sarya_ui.dart';
//
// class SearchPlacesMap extends StatefulWidget {
//   const SearchPlacesMap({
//     Key? key,
//     required this.itineraryIndex,
//   }) : super(key: key);
//
//   final int itineraryIndex;
//
//   @override
//   _SearchPlacesMapState createState() => _SearchPlacesMapState();
// }
//
// class _SearchPlacesMapState extends State<SearchPlacesMap> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CreateItineraryCubit, CreateItineraryState>(
//         builder: (context, state) {
//       final geographicLocation =
//           state.itinerary.itineraryDays[widget.itineraryIndex].accommodation;
//       return LocationSelector(
//         prefixIcon: Image.asset(
//           'assets/icons/accommodation_field.png',
//           width: 20.0,
//           height: 20.0,
//           color: SaryaColors.black,
//         ),
//         hintText: 'Accommodation',
//         geographicLocations:
//             geographicLocation != null ? [geographicLocation] : [],
//         onTap: () async {
//           await showCupertinoModalBottomSheet(
//             expand: true,
//             useRootNavigator: true,
//             context: context,
//             builder: (modalContext) => BlocProvider.value(
//               value: BlocProvider.of<CreateItineraryCubit>(context),
//               child: BlocBuilder<CreateItineraryCubit, CreateItineraryState>(
//                   builder: (context, state) {
//                 final accommodation = state.itinerary
//                     .itineraryDays[widget.itineraryIndex].accommodation;
//                 return PlacesSearchModal(
//                   passedContext: context,
//                   modalContext: modalContext,
//                   title: 'Search accommodation',
//                   geographicLocations:
//                       accommodation != null ? [accommodation] : [],
//                   onPlaceSelected: (Place place) {
//                     context
//                         .read<CreateItineraryCubit>()
//                         .addAccommodationLocation(
//                           place,
//                           widget.itineraryIndex,
//                         );
//                   },
//                   onGeographicLocationDeleted:
//                       (GeographicLocation geographicLocation) {
//                     context
//                         .read<CreateItineraryCubit>()
//                         .deleteAccommodationLocation(widget.itineraryIndex);
//                   },
//                 );
//               }),
//             ),
//           );
//           context.read<CreateItineraryCubit>().clearSearchResults();
//         },
//       );
//     });
//   }
// }
