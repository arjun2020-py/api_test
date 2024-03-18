import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import '../model/cast_model.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit(this.context) : super(CastInitial());
  BuildContext context;

    Future<List<CastModel>> postsFuture = getShows();

  static Future<List<CastModel>> getShows() async {
    var url = Uri.parse("https://api.tvmaze.com/shows");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});
    final List body = json.decode(response.body);
    return body.map((e) => CastModel.fromJson(e)).toList();
  }
}
