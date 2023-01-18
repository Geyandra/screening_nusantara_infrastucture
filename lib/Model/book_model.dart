class BooksModel {
  int? id;
  int? userId;
  String? isbn;
  String? title;
  String? subtitle;
  String? author;
  DateTime? published;
  String? publisher;
  int? pages;
  String? description;
  String? website;
  String? createdAt;
  String? updatedAt;

  BooksModel(
      {this.id,
      this.userId,
      this.isbn,
      this.title,
      this.subtitle,
      this.author,
      this.published,
      this.publisher,
      this.pages,
      this.description,
      this.website,
      this.createdAt,
      this.updatedAt});

  BooksModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    isbn = json['isbn'];
    title = json['title'];
    subtitle = json['subtitle'];
    author = json['author'];
    published = json['published'];
    publisher = json['publisher'];
    pages = json['pages'];
    description = json['description'];
    website = json['website'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['isbn'] = this.isbn;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['author'] = this.author;
    data['published'] = this.published;
    data['publisher'] = this.publisher;
    data['pages'] = this.pages;
    data['description'] = this.description;
    data['website'] = this.website;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
