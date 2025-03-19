import 'package:faker/faker.dart';

class ReviewModel {
  final int id;
  final String reviewId;
  final String reviewName;
  final double rating;
  final String comment;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
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
        reviewId: faker.guid.guid(),
        reviewName: faker.person.name(),
        rating: faker.randomGenerator.decimal(min: 2.0, scale: 5.0),
        comment: faker.lorem.sentence(),
        createdAt: faker.date.dateTime(),
      );
    });
  }
}
