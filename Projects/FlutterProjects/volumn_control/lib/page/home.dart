import 'package:flutter/material.dart';
import 'package:volumn_control/public/myassets.dart';
import 'package:volumn_control/public/mypadding.dart';
import 'package:volumn_control/public/mywidths.dart';
import 'package:volumn_control/widget/custom_column.dart';
import 'package:volumn_control/widget/custom_image_asset.dart';
import 'package:volumn_control/widget/custom_row.dart';
import 'package:volumn_control/public/mytextsize.dart';
import 'package:volumn_control/widget/custom_text.dart';
import 'package:volumn_control/widget/text_icon_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final width_padding = width / 8;
    final width_item = (width  / 2)-width_padding-PaddingD.padding16;
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(MyAssets.bg), fit: BoxFit.cover)),
          width: width,
          height: height,
          child: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width_padding),
            child: customColumn(children: [
              customRow(children: [
                text_custom(
                    text: 'VOLUME\nCONTROL',
                    weight: FontWeight.bold,
                    size: TextSize.text64),
                customImageAsset(
                  width: MyWidths.width_logo,
                  path: MyAssets.logo,
                ),
              ]),
              SizedBox(
                height: height / 7,
              ),
              //grid of items [4]
              SizedBox(
                width: width,
                child: customColumn(children: [
                  customRow(children: [
                    text_icon_item(
                        onTap: () {
                          debugPrint('floor plan');
                        },
                        paddingVer: PaddingD.padding24,
                        pathAsset: MyAssets.floor,
                        text: "FLOOR\nPLAN",
                        hasWidth: true,
                        width: width_item),
                     text_icon_item(
                        onTap: () {
                          debugPrint('zone');
                        },
                        paddingVer: PaddingD.padding24,
                        pathAsset: MyAssets.zone,
                        text: "BY\nZONE",
                        hasWidth: true,
                        width: width_item),
                  ]),
                  const SizedBox(height: PaddingD.padding32,),
                  customRow(children: [
                    text_icon_item(
                        onTap: () {
                          debugPrint('by floor');
                        },
                        paddingVer: PaddingD.padding24,
                        pathAsset: MyAssets.zone,
                        text: "BY\nFLOOR",
                        hasWidth: true,
                        width: width_item),
                     text_icon_item(
                        onTap: () {
                          debugPrint('preset');
                        },
                        paddingVer: PaddingD.padding24,
                        pathAsset: MyAssets.preset,
                        text: "PRESET",
                        hasWidth: true,
                        hasWidthAssetDiff: true,
                        width: width_item),
                  ])
                ]),
              )
            ]),
          )),
        ));
  }
}
