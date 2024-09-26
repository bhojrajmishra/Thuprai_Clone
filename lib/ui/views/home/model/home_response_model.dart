class HomeResponseModel {
  final String title;
  final String englishTitle;
  final String slug;
  final String frontCover;

  HomeResponseModel({
    required this.title,
    required this.englishTitle,
    required this.slug,
    required this.frontCover,
  });

  factory HomeResponseModel.fromJson(Map<String, dynamic> json) {
    return HomeResponseModel(
      title: json['title'] as String,
      englishTitle: json['english_title'] as String,
      slug: json['slug'] as String,
      frontCover: json['front_cover'] as String,
    );
  }
}

class Pagination {
  final int count;
  final int page;
  final int pages;
  final String? previous;
  final String? next;
  final int size;

  Pagination({
    required this.count,
    required this.page,
    required this.pages,
    this.previous,
    this.next,
    required this.size,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      count: json['count'] as int,
      page: json['page'] as int,
      pages: json['pages'] as int,
      previous: json['previous'],
      next: json['next'],
      size: json['size'] as int,
    );
  }
}

class BookResponse {
  final Pagination pagination;
  final List<HomeResponseModel> results;

  BookResponse({required this.pagination, required this.results});

  factory BookResponse.fromJson(Map<String, dynamic> json) {
    return BookResponse(
      pagination: Pagination.fromJson(json['pagination']),
      results: (json['results'] as List)
          .map((book) =>
              HomeResponseModel.fromJson(book as Map<String, dynamic>))
          .toList(),
    );
  }
}
