import 'package:art_work/features/home/data/models/exercise.dart';
import 'package:art_work/features/home/domain/repositories/home_repository.dart';
import '../../../../core/data_sources/remote.dart';
import '../../../../core/network.dart';


class ExerciseRepositoryImpl implements ExerciseRepository {
  final FirebaseHelper _firebaseHelper = FirebaseHelper();

  final ConnectivityHelper _connectivityHelper = ConnectivityHelper();

  Future<bool> hasInternetConnection() async {
    return await _connectivityHelper.isConnected();
  }

  @override
  Future<List<ExerciseModel>> getExercises() async{
    List<ExerciseModel> articles = [];
    if (await hasInternetConnection()) {
      try {
        final querySnapshot = await _firebaseHelper.getDataFromFirestore('courses');

        if(querySnapshot.isEmpty) {
          articles = [];
        } else {
          for (var doc in querySnapshot) {
            final data = doc.data() as Map<String, dynamic>;
            print('data $data');
            final article = ExerciseModel(
              title: data['title'] ?? '',
              icon: data['icon'] ?? '',
            );
            articles.add(article);
          }
        }
        return articles;
      } catch (e) {
        print("Error getting articles: $e");
        return articles; // Return an empty list in case of an error
      }
    } else {
      throw Exception('No internet connection');
    }
  }

}