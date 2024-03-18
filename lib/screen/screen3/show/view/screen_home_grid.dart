import 'package:api_test/screen/screen3/show/cubit/show_cubit.dart';
import 'package:api_test/screen/screen3/show/model/show_model.dart';

import 'package:flutter/material.dart' as materal;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen_detailed.dart';

class ScreenHomeGrid extends materal.StatelessWidget {
  const ScreenHomeGrid({super.key});

  @override
  materal.Widget build(materal.BuildContext context) {
    return BlocProvider(
      create: (context) => ShowCubit(context),
      child: BlocBuilder<ShowCubit, ShowState>(
        builder: (context, state) {
          var cubit = context.read<ShowCubit>();

          return materal.Scaffold(
            appBar: materal.AppBar(
              backgroundColor: materal.Colors.red,
              centerTitle: true,
              title: materal.Text('Shows'),
            ),
            body: materal.FutureBuilder<List<ShowModel>>(
                future: cubit.postsFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState ==
                      materal.ConnectionState.waiting) {
                    return materal.Center(
                        child: materal.CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    var show = snapshot.data!;
                    return materal.GridView.builder(
                      itemCount: show.length,
                      gridDelegate:
                          materal.SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 4.0,
                              mainAxisSpacing: 4.0),
                      itemBuilder: (context, index) {
                        var shows = show[index];

                        return materal.InkWell(
                          onTap: () => materal.Navigator.of(context).push(materal.MaterialPageRoute(builder: (context) => ScreenDetiledShow(shows: shows,),)),
                          child: materal.Container(
                            child: materal.Column(
                              children: [
                                materal.Image.network(
                                  shows.image.original,
                                  width: 100,
                                ),
                                materal.Text(shows.name),
                                materal.Text(shows.language.name)
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return materal.Center(
                    child: materal.CircularProgressIndicator(),
                  );
                }),
          );
        },
      ),
    );
  }
}
