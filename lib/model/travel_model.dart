import 'package:faker/faker.dart';
import 'package:travel/model/review_model.dart';

class TravelModel {
  final int id;
  final String title;
  final String photo;
  final String summary;
  final double rating;
  final int reviews;
  final List<String> include;
  final List<String> exclude;
  final String termsConditions;
  final double price;
  final String currency;
  final String pax;
  final List<ReviewModel> tripReviews;

  TravelModel({
    required this.id,
    required this.title,
    required this.photo,
    required this.summary,
    required this.rating,
    required this.reviews,
    required this.include,
    required this.exclude,
    required this.termsConditions,
    required this.price,
    required this.currency,
    required this.pax,
    required this.tripReviews,
  });

  static List<TravelModel> generateFakeTravel(int count) {
    final faker = Faker();

    return List.generate(count, (index) {
      return TravelModel(
        id: index + 1,
        title: faker.address.city(),
        photo: "https://picsum.photos/400/300?random=${index + 1}",
        summary: faker.lorem.sentences(2).join(""),
        rating: faker.randomGenerator.decimal(min: 2.0, scale: 5.0),
        reviews: faker.randomGenerator.integer(1000, min: 10),
        include: List.generate(3, (_) => faker.lorem.word()),
        exclude: List.generate(3, (_) => faker.lorem.word()),
        termsConditions: faker.lorem.sentences(1).join(" "),
        price: faker.randomGenerator.decimal(min: 100, scale: 500),
        currency: "USD",
        pax:
            "${faker.randomGenerator.integer(4, min: 1)}-${faker.randomGenerator.integer(10, min: 5)}",
        tripReviews: ReviewModel.generateFakeReview(5),
      );
    });
  }
}
