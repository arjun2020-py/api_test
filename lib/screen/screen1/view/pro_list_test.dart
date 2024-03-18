import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constents.dart';
import '../../compoents/new_cart_skelton.dart';
import '../cubit/api_tets_cubit.dart';

class ProApiTest extends StatelessWidget {
  const ProApiTest({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiTetsCubit(context),
      child: BlocBuilder<ApiTetsCubit, ApiTetsState>(
        builder: (context, state) {
          var cubit = context.read<ApiTetsCubit>();
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Product List'),
            ),
            body:
             FutureBuilder(
                future: cubit.featchProduct(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return ListView.separated(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) => const NewsCardSkelton(),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: defaultPadding),
                    );
                   
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        print(
                            'length of list -------- ${snapshot.data?.length}------');
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text(
                                snapshot.data![index].title.substring(0, 1)),
                          ),
                          title: Text(snapshot.data![index].title),
                          subtitle: Text(snapshot.data![index].id.toString()),
                        //  trailing: Text(snapshot.data![index].body),
                        );
                      },
                    );
                  }
                }),
          );
        },
      ),
    );
  }
}
