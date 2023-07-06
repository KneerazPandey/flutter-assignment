import 'package:http/http.dart';

import './exceptions.dart';

class HttpErrorHandling<Type> {
  Type handleHttpError({
    required Response response,
    required Type Function() onSuccess,
  }) {
    if (response.statusCode == 201) {
      return onSuccess();
    }

    if (response.statusCode == 200) {
      return onSuccess();
    }

    if (response.statusCode == 400) {
      throw const Http404NotFoundException(
        'Unable to connect to the path you are specifying',
      );
    }

    if (response.statusCode == 404) {
      throw const Http404NotFoundException(
        'Unable to connect to the path you are specifying',
      );
    }

    if (response.statusCode == 403) {
      throw const Http404NotFoundException(
        'Unable to connect to the path you are specifying',
      );
    }

    throw (const ServerException('Unable to connect to server'));
  }
}
