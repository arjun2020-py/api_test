import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/api_tets_cubit.dart';
import '../model/api_test_model.dart';

class ApiTests extends StatelessWidget {
  const ApiTests({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiTetsCubit(context),
      child: BlocBuilder<ApiTetsCubit, ApiTetsState>(
        builder: (context, state) {
          var cubit = context.read<ApiTetsCubit>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue[300],
              centerTitle: true,
              title: Text('Product List'),
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: 1,
              itemBuilder: (context, index) {
                return FutureBuilder<ApiTest>(
                    future: cubit.getApiData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(snapshot.data!.image)
                              //  AssetImage('assets/images/Frame 8255.jpg'),
                              ),
                          title: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data!.id.toString()),
                              Text(snapshot.data!.title),
                            ],
                          ),
                          subtitle: Text(snapshot.data!.description),
                          trailing: Text(snapshot.data!.price.toString()),
                        );
                      }
                      if (snapshot.hasError) {
                        Text('some error is occured');
                      }
                       return Center(child: CupertinoActivityIndicator());

                       
                    });
              },
            ),
          );
        },
      ),
    );
  }
}
