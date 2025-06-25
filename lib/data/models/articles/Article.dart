
import 'package:news_app/data/models/sources/Source.dart';

/// source : {"id":"the-verge","name":"The Verge"}
/// author : "Emma Roth"
/// title : "Trump’s media company says it’s buying $2.5 billion in Bitcoin"
/// description : "President Donald Trump’s media company could soon own $2.5 billion in Bitcoin. On Tuesday, Trump Media announced that it’s working with “approximately 50 institutional investors” to sell and issue $1.5 billion in stock and $1 billion in convertible notes. The…"
/// url : "https://www.theverge.com/news/674684/trump-media-bitcoin-treasury-deal"
/// urlToImage : "https://platform.theverge.com/wp-content/uploads/sites/2/2025/03/STK466_ELECTION_2024_CVirginia_F.webp?quality=90&strip=all&crop=0%2C10.732984293194%2C100%2C78.534031413613&w=1200"
/// publishedAt : "2025-05-27T14:31:48Z"
/// content : "The Truth Social operator will get the money from a deal with investors.\r\nThe Truth Social operator will get the money from a deal with investors.\r\nPresident Donald Trumps media company could soon ow… [+1795 chars]"

class Article {

  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}