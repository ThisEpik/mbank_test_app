import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mbank_test_app/data/global_constants/localization_text.dart';
import 'package:mbank_test_app/data/utils/colourful_print.dart';
import 'package:mbank_test_app/ui/widgets/custom_snack_bar.dart';

/// the powerful http client
abstract class CustomDio {
  static final Dio _dio = Dio();

  static Future<Response?> post(
    BuildContext context,
    String url,
    dynamic body,
    void Function(int statusCode, dynamic errorData) onError,
  ) async {
    Response? response;
    try {
      response = await _dio.post(
        url,
        data: body,
      );
    } on DioError catch (error, stackTrace) {
      _validateResponseErrors(error, stackTrace, url, onError);
      _validateCommonErros(context, error.type);
      return null;
    } catch (error) {
      print(error);
      print(url);
      CustomSnackBar.showSomethingWentWrong(context);

      return null;
    }

    if (response.statusCode! == 200 || response.statusCode! == 201) {
      return response;
    } else {
      return null;
    }
  }

  static Future<Response?> patch(BuildContext context, String url, dynamic body,
      void Function(int statusCode, dynamic errorData) onError) async {
    Response? response;
    try {
      response = await _dio.patch(url, data: body);
    } on DioError catch (error, stackTrace) {
      _validateResponseErrors(error, stackTrace, url, onError);
      _validateCommonErros(context, error.type);
      return null;
    } catch (error) {
      print(error);
      print(url);
      CustomSnackBar.showSomethingWentWrong(context);

      return null;
    }

    if (response.statusCode! == 200 || response.statusCode! == 201) {
      return response;
    } else {
      return null;
    }
  }

  static Future<Response?> get(
    BuildContext context,
    String url,
    void Function(int statusCode, dynamic errorData) onError,
  ) async {
    Response? response;
    try {
      response = await _dio.get(url);
    } on DioError catch (error, stackTrace) {
      _validateResponseErrors(error, stackTrace, url, onError);
      _validateCommonErros(context, error.type);

      return null;
    } catch (error) {
      print(error);
      print(url);
      CustomSnackBar.showSomethingWentWrong(context);

      return null;
    }

    if (response.statusCode! == 200 || response.statusCode! == 201) {
      return response;
    } else {
      return null;
    }
  }

  static Future<Response?> delete(
    BuildContext context,
    String url,
    void Function(int statusCode, dynamic errorData) onError,
  ) async {
    Response? response;
    try {
      response = await _dio.delete(url);
    } on DioError catch (error, stackTrace) {
      _validateResponseErrors(error, stackTrace, url, onError);
      _validateCommonErros(context, error.type);

      return null;
    } catch (error) {
      print(error);
      print(url);
      CustomSnackBar.showSomethingWentWrong(context);

      return null;
    }

    if (response.statusCode! == 200 ||
        response.statusCode! == 201 ||
        response.statusCode! == 204) {
      return response;
    } else {
      return null;
    }
  }

  static Future<Response?> download(
    BuildContext context,
    String url,
    String savePath,
    void Function(int statusCode, dynamic errorData) onError,
  ) async {
    Response? response;
    try {
      response = await _dio.download(
        url,
        savePath,
        onReceiveProgress: (count, total) {
          String progress = ((count / total) * 100).toStringAsFixed(0);
          print('Download file: $progress%');
        },
      );
    } on DioError catch (error, stackTrace) {
      _validateResponseErrors(error, stackTrace, url, onError);
      _validateCommonErros(context, error.type);

      return null;
    } catch (error) {
      print(error);
      print(url);
      CustomSnackBar.showSomethingWentWrong(context);

      return null;
    }

    if (response.statusCode! == 200 ||
        response.statusCode! == 201 ||
        response.statusCode! == 204) {
      return response;
    } else {
      return null;
    }
  }

  static void _validateResponseErrors(DioError error, StackTrace stackTrace,
      String url, Function(int statusCode, dynamic errorData) onError) {
    // printRed(error);
    printGreen(url);

    if (error.type == DioErrorType.badResponse) {
      printRed('Dio error status code: ${error.response!.statusCode!}');
      printYellow(error.response!.data);
      onError(error.response!.statusCode!, error.response!.data);
    }
  }

  static void _validateCommonErros(
      BuildContext context, DioErrorType errorType) {
    switch (errorType) {
      case DioErrorType.sendTimeout:
        CustomSnackBar.show(context, LocalizationText.noInternetConnection,
            color: Colors.red);
        break;
      case DioErrorType.receiveTimeout:
        CustomSnackBar.show(context, LocalizationText.recieveTimeOut,
            color: Colors.red);
        break;
      case DioErrorType.unknown:
        CustomSnackBar.showSomethingWentWrong(context);
        break;
      default:
    }
  }
}
