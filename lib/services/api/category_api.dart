import 'package:dio/dio.dart';
import 'package:tms/app/data/model/CategoryPlace.dart';

class CategoryApi {
  final Dio _apiClient;

  CategoryApi({
    required Dio apiClient,
  }) : _apiClient = apiClient {
    _apiClient.options.headers['requires_token'] = false;
  }

  Future<List<CategoryPlace>?> fetchPlaceCategory({required int page}) async {
    return [
      CategoryPlace(
          id: 1,
          image:
              'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Pashupatinath_Temple-2020.jpg/1200px-Pashupatinath_Temple-2020.jpg',
          title: ' Visit Pasupatinath Temple  ',
          description:
              'The Pasupati Nath Temple is a sacred Hindu temple located in Kathmandu, Nepal, dedicated to Lord Shiva. It is one of the most significant pilgrimage sites for Hindus worldwide. The temple\'s architecture is a beautiful blend of pagoda-style and traditional Nepalese architecture, with intricate woodcarvings and detailed artwork adorning its structures ,This temple situated on the banks of the holy River Bagmati is the most revered Hindu temple in Nepal. The main temple complex is open only to the Hindus; non-Hindus must satisfy themselves by observing from the terraces just across the Bagmati River to the east. As a mark of reverence and tradition, leather items that include shoes, belts and cameras are forbidden within the temple complex and must be left outside. Photography is strictly prohibited   ',
          rating: 6.2,
          isfavorite: false),
      CategoryPlace(
        id: 2,
        rating: 5.6,
        isfavorite: false,
        image:
            'https://img.etimg.com/thumb/width-1200,height-900,imgsize-481830,resizemode-75,msid-70411916/industry/services/travel/pokhara-a-city-known-for-its-tranquil-lakes-snowy-peaks-and-quaint-villages.jpg',
        title: 'Best place in pokhara ',
        description:
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
      ),
      CategoryPlace(
        id: 3,
        isfavorite: true,
        rating: 8.2,
        image:
            'https://media.nepalmotherhousetreks.com/uploads/media/blog/Tilicho-Lake-Mananag.jpg',
        title: 'manage breathtaking view in winter season',
        description: 'Best place in pokhara ',
      ),
      CategoryPlace(
        id: 4,
        rating: 6.2,
        isfavorite: false,
        image:
            'https://media.allnepalhiking.com/uploads/fullbanner/488aa5768ca9ab26612b83fad400d1b8-1.webp',
        title: ' Pashupatinath Temple is the oldest Hindu temple in Kathmandu',
        description: 'annapurna base camp',
      ),
      CategoryPlace(
        id: 5,
        rating: 6.2,
        isfavorite: false,
        image:
            'https://www.nepalsanctuarytreks.com/wp-content/uploads/2018/10/lumbini.jpg',
        title: 'the Birth Place of Gautam Buddha',
        description: 'Best place in pokhara ',
      ),
      CategoryPlace(
        id: 6,
        rating: 5.2,
        isfavorite: true,
        image:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c0/Butwal.jpg/1200px-Butwal.jpg',
        title: 'sutunnig view of butwal from top',
        description: 'Best place in pokhara ',
      ),
      CategoryPlace(
        id: 7,
        rating: 6.2,
        isfavorite: true,
        image:
            'https://nepaltraveller.com/images/main/1672990694.sidetrackimageoren-yomtov-Da46CKQ88jI-unsplash.jpg',
        title: 'the Birth Place of Gautam Buddha',
        description: 'let\'s got with clear sky vibe',
      ),
      CategoryPlace(
        id: 8,
        rating: 4.2,
        isfavorite: false,
        image:
            'https://risingnepaldaily.com/storage/media/26250/118582708_4262380870503511_7191211685942392003_n.jpg',
        title: 'the Birth Place of Gautam Buddha',
        description: 'stunning nigh view',
      ),
      CategoryPlace(
        id: 9,
        rating: 7.2,
        isfavorite: true,
        image:
            'https://risingnepaldaily.com/storage/media/26250/118582708_4262380870503511_7191211685942392003_n.jpg',
        title: 'the Birth Place of Gautam Buddha',
        description: 'Best place in pokhara ',
      ),
    ];
  }
}
