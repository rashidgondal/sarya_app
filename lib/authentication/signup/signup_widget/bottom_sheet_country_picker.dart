import 'package:flutter/material.dart';

import '../../../theme/color_scheme.dart';

class BottomSheetCountryPicker extends StatefulWidget {
  final List countries;
  final Function(String)? countryName;
  final Function(String)? countryTel;
  final Function(String)? nationality;
  const BottomSheetCountryPicker(
      {Key? key,
      required this.countries,
      this.countryName,
      this.countryTel,
      this.nationality})
      : super(key: key);

  @override
  State<BottomSheetCountryPicker> createState() =>
      _BottomSheetCountryPickerState();
}

class _BottomSheetCountryPickerState extends State<BottomSheetCountryPicker> {
  String searchKeyWord = '';
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Row(
          children: [
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 40,
                padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 1, color: Colors.black12)),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  onChanged: (v) {
                    searchKeyWord = v;
                    setState(() {});
                  },
                  style: const TextStyle(
                      fontSize: 15.0,
                      color: AppColor.lightIndigo,
                      fontWeight: FontWeight.w500),
                  decoration: const InputDecoration(
                      hintText: " Search",
                      isDense: true,
                      border: InputBorder.none,
                      fillColor: AppColor.aquaCasper,
                      contentPadding: EdgeInsets.zero,
                      hintStyle: TextStyle(
                          fontSize: 14.0,
                          color: AppColor.colorGrey,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...widget.countries.map((e) {
                  if (searchKeyWord.isEmpty) {
                    return ListTile(
                      onTap: () {
                        widget.countryName!.call('${e['name']}');
                        widget.countryTel!.call('${e['tel']}');
                        widget.nationality!.call('${e['nationality']}');

                        Navigator.of(context).pop();
                      },
                      title: Text('${e['name']}',
                          style: const TextStyle(fontSize: 14)),
                      trailing: Text('${e['tel']}',
                          style: const TextStyle(
                              fontSize: 13, color: Colors.black26)),
                    );
                  } else {
                    if ('${e['name']}'.contains(searchKeyWord)) {
                      return ListTile(
                        onTap: () {
                          widget.countryName!.call('${e['name']}');
                          widget.countryTel!.call('${e['tel']}');
                          widget.nationality!.call('${e['nationality']}');
                          Navigator.of(context).pop();
                        },
                        title: Text('${e['name']}'),
                        trailing: Text('${e['tel']}'),
                      );
                    } else {
                      if ('${e['name']}'
                          .toLowerCase()
                          .contains(searchKeyWord.toLowerCase())) {
                        return ListTile(
                          onTap: () {
                            widget.countryName!.call('${e['name']}');
                            widget.countryTel!.call('${e['tel']}');
                            widget.nationality!.call('${e['nationality']}');
                            Navigator.of(context).pop();
                          },
                          title: Text('${e['name']}'),
                          trailing: Text('${e['tel']}'),
                        );
                      } else {
                        return SizedBox();
                      }
                    }
                  }
                }).toList(),
              ],
            ),
          ),
        )
      ],
    );
  }
}
