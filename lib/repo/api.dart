import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ki_part/models/exception.dart';
import 'package:ki_part/repo/agency_repo.dart';
import 'package:ki_part/repo/ticket_repo.dart';
import 'package:ki_part/repo/travel_repo.dart';
import 'package:ki_part/repo/user_repo.dart';

class Api {
  static final _instance =
      Api._(UserRepo(_appDio), AgencyRepo(_appDio), TravelRepo(_appDio), TicketRepo(_appDio));
  static final Dio _appDio =
      Dio(BaseOptions(baseUrl: "http://kipart.stillforce.tech/"));

  late UserRepo userRepo;
  late TravelRepo travelRepo;
  late AgencyRepo agencyRepo;
  late TicketRepo ticketRepo;
  factory Api() {
    return _instance;
  }

  Api._(this.userRepo, this.agencyRepo, this.travelRepo, this.ticketRepo) {
    _appDio.interceptors.add(_LoggingInterceptor());
    _appDio.interceptors.add(_ErrorInterceptor());
  }

  void updateToken(String? token) {
    _appDio.options.headers["Authorization"] = token;
  }
}

class _LoggingInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("ERROR: ${err.response?.statusCode}\nMESSAGE: ${err.message}");
    handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint("REQUEST: ${options.method}-> ${options.path}\n${options.data}");
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint("RESPONSE: ${response.statusCode}, ${response.statusMessage}");
    handler.resolve(response);
  }
}

class _ErrorInterceptor implements Interceptor {
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _builError(err, handler);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {}
  _builError(DioError error, ErrorInterceptorHandler handler) {
    MyException exception = MyException(
        error: error, code: error.response?.statusCode, details: error.message);
    if (error.response != null) {
      exception = MyException(
          error: error,
          code: error.response?.statusCode,
          details: error.response?.data?.toString());
    } else {
      switch (error.error.runtimeType) {
        case MyException:
          exception = error.error;
          break;
        case SocketException:
          var localError = (error.error as SocketException).osError;
          exception = MyException(error: error, details: localError?.message);
          break;
        case TimeoutException:
          exception = MyException.connectionTimeOut(error);
          break;
        default:
          if (error.type == DioErrorType.connectTimeout ||
              error.type == DioErrorType.receiveTimeout ||
              error.type == DioErrorType.sendTimeout) {
            exception = MyException.connectionTimeOut(error);
          } else if (error.type == DioErrorType.other) {
            exception = MyException(error: error, details: error.message);
          } else {
            exception = MyException(error: error, details: error.message);
          }
      }
    }
    handler.reject(exception);
  }
}
