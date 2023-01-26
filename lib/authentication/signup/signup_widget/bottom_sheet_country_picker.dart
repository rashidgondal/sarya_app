import 'package:flutter/material.dart';

import '../../../theme/color_scheme.dart';

class BottomSheetCountryPicker extends StatefulWidget {
  final List countries;
  final Function(String)? country_name;
  final Function(String)? country_tel;
  const BottomSheetCountryPicker(
      {Key? key, required this.countries, this.country_name, this.country_tel})
      : super(key: key);

  @override
  State<BottomSheetCountryPicker> createState() =>
      _BottomSheetCountryPickerState();
}

class _BottomSheetCountryPickerState extends State<BottomSheetCountryPicker> {
  String searchKeyWord = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 50),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Container(
                  height: 40,
                  padding: EdgeInsets.only(top: 10, left: 10, right: 10),
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
              SizedBox(
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
                          widget.country_name!.call('${e['name']}');
                          widget.country_tel!.call('${e['tel']}');
                          Navigator.of(context).pop();
                        },
                        title: Text('${e['name']}',
                            style: TextStyle(fontSize: 14)),
                        trailing: Text('${e['tel']}',
                            style:
                                TextStyle(fontSize: 13, color: Colors.black26)),
                      );
                    } else {
                      if ('${e['name']}'
                          .toLowerCase()
                          .contains(searchKeyWord.toLowerCase())) {
                        return ListTile(
                          onTap: () {
                            widget.country_name!.call('${e['name']}');
                            widget.country_tel!.call('${e['tel']}');
                            Navigator.of(context).pop();
                          },
                          title: Text('${e['name']}'),
                          trailing: Text('${e['tel']}'),
                        );
                      } else {
                        return SizedBox();
                      }
                    }
                  }).toList(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
