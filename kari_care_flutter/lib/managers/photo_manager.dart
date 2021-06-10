import 'package:kari_care_flutter/models/photo.dart';
import 'package:kari_care_flutter/services/services.dart';

class PhotoManager {
  final _apiService = APIService(API.sandbox());
  Stream<List<Photo>> get photoListFromPage1 async* {
    yield await _apiService.fetchPhotos(PageIndex.page1);
  }

  Stream<List<Photo>> get photoListFromPage2 async* {
    yield await _apiService.fetchPhotos(PageIndex.page2);
  }

  Stream<List<Photo>> get photoListFromPage3 async* {
    yield await _apiService.fetchPhotos(PageIndex.page3);
  }
}
