import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../model/show_model.dart';

part 'show_state.dart';

class ShowCubit extends Cubit<ShowState> {
  ShowCubit(this.context) : super(ShowInitial()) {
    // getShowModel();
    getShows();
  }
  BuildContext context;
  // late List<ShowModel> showResponseData;

  //save this list of posts into a variable
  Future<List<ShowModel>> postsFuture = getShows();

  static Future<List<ShowModel>> getShows() async {
    var url = Uri.parse("https://api.tvmaze.com/shows");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => ShowModel.fromJson(e)).toList();
  }
}
