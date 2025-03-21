import 'package:faker/faker.dart';

class ReviewModel {
  final int id;
  final String picture;
  final String reviewId;
  final String reviewName;
  final double rating;
  final String comment;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.picture,
    required this.reviewId,
    required this.reviewName,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  static List<ReviewModel> generateFakeReview(int count) {
    final faker = Faker();

    return List.generate(count, (index) {
      return ReviewModel(
        id: index + 1,
        picture: "https://picsum.photos/80/80?random=${index + 1}",
        reviewId: faker.guid.guid(),
        reviewName: faker.person.name(),
        rating: 2 + faker.randomGenerator.decimal() * (3),
        comment: faker.lorem.sentences(3).join(" "),
        createdAt: faker.date.dateTime(),
      );
    });
  }
}
