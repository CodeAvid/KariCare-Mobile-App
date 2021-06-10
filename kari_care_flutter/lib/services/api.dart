import 'api_key.dart';

enum Endpoint {
  cases,
  casesSuspected,
  casesConfirmed,
}

enum PageIndex { page1, page2, page3 }

class API {
  static final String _host = 'api.unsplash.com';
  static final String _scheme = 'https';

  final String apiKey;
  API({
    this.apiKey,
  });
  factory API.sandbox() => API(apiKey: APIKey.photo);

  Uri pageUri(PageIndex index) => Uri(
        scheme: _scheme,
        host: _host,
        path: 'photos',
        queryParameters: {
          "client_id": "TOCnwUYSNssEFuqTc-nrr9W50ONTeLfn1G8W4dyD_to",
          "page": _pages[index],
        },
      );

  static Map<PageIndex, String> _pages = {
    PageIndex.page1: '1',
    PageIndex.page2: '2',
    PageIndex.page3: '3',
  };
}
