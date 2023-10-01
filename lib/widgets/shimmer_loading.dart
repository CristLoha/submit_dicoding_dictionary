import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:submit_dicoding_dictionary/shared/theme.dart';

class ShimmerLoadingList extends StatelessWidget {
  final int itemCount;

  const ShimmerLoadingList({required this.itemCount, super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: const Color.fromRGBO(224, 224, 224, 1),
          highlightColor: const Color.fromRGBO(245, 245, 245, 1),
          child: ListTile(
            title: Container(
              width: 50,
              height: 15.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
              ),
            ),
            subtitle: Container(
              width: 60,
              height: 10.0,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        );
      },
    );
  }
}
