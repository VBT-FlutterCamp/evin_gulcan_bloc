import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../core/constant/baseUrl_constant.dart';
import '../../core/constant/color_constant.dart';
import '../service/unknown_service.dart';
import '../viewModel/unknown_view_model.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UnknownCubit(
            unknownService: UnknownService(
                Dio(BaseOptions(baseUrl: BaseUrlConstant.baseUrl)))),
        child: BlocConsumer<UnknownCubit, UnknownState>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(body: _buildScaffold(context));
            }));
  }

  SizedBox _buildScaffold(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(0.9),
      child: context.read<UnknownCubit>().isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: context.dynamicHeight(0.6),
              child: _buildGridViewbuilder(context),
            ),
    );
  }

  GridView _buildGridViewbuilder(BuildContext context) {
    return GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: context.read<UnknownCubit>().model?.data?.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildCard(context, index);
        });
  }

  Card _buildCard(BuildContext context, int index) {
    double _elevationCard = 15;
    return Card(
      color: randowColors(),
      elevation: _elevationCard,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(context.read<UnknownCubit>().model?.data?[index].name ?? ''),
        Text(context.read<UnknownCubit>().model?.data?[index].color ?? ''),
      ]),
    );
  }
}
