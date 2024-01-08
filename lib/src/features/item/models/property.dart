class Property {
  String? purpose;
  double? price;
  String? title;
  CoverPhoto? coverPhoto;
  String? description;
  List<Photos>? photos;
  String? externalID;

  Property({
    this.purpose,
    this.price,
    this.title,
    this.coverPhoto,
    this.description,
    this.photos,
    required this.externalID,
  });

  Property.fromJson(Map<String, dynamic> json) {
    purpose = json['purpose'] ?? '';
    price = json['price'] ?? 0;
    title = json['title'] ?? '';
    description = json['description'] ?? '';
    externalID = json['externalID'] ?? '';
    coverPhoto = json['coverPhoto'] != null
        ? CoverPhoto.fromJson(json['coverPhoto'])
        : null;

    if (json['photos'] != null) {
      photos = <Photos>[];
      json['photos'].forEach((v) {
        photos!.add(Photos.fromJson(v));
      });
    }
  }
}

class CoverPhoto {
  int? id;
  String? externalID;
  String? title;
  int? orderIndex;
  double? nimaScore;
  String? url;
  bool? main;

  CoverPhoto(
      {this.id,
      this.externalID,
      this.title,
      this.orderIndex,
      this.nimaScore,
      this.url,
      this.main});

  CoverPhoto.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    externalID = json['externalID'] ?? '';
    title = json['title'] ?? '';
    orderIndex = json['orderIndex'] ?? 0;
    nimaScore = json['nimaScore'] ?? 0.0;
    url = json['url'] ?? '';
    main = json['main'] ?? false;
  }
}

class Photos {
  String? url;

  Photos({this.url});

  Photos.fromJson(Map<String, dynamic> json) {
    url = json['url'] ?? '';
  }
}



// class Property {
//   final String prettyUrl;
//   final bool standard;
//   final bool midtier;
//   final Lister lister;
//   final bool featured;
//   final bool signature;
//   final String constructionStatus;
//   final String channel;
//   final String description;
//   final String title;
//   final Price price;
//   final String propertyType;
//   final MainImage mainImage;

//   Property({
//     required this.prettyUrl,
//     required this.standard,
//     required this.midtier,
//     required this.lister,
//     required this.featured,
//     required this.signature,
//     required this.constructionStatus,
//     required this.channel,
//     required this.description,
//     required this.title,
//     required this.price,
//     required this.propertyType,
//     required this.mainImage,
//   });

//   factory Property.fromJson(Map<String, dynamic> json) {
//     return Property(
//         prettyUrl: json['prettyUrl'] as String? ?? '',
//         standard: json['standard'] as bool? ?? false,
//         midtier: json['midtier'] as bool? ?? false,
//         lister: json['lister'] != null
//             ? Lister.fromJson(json['lister'] as Map<String, dynamic>)
//             : Lister.empty(),
//         featured: json['featured'] as bool? ?? false,
//         signature: json['signature'] as bool? ?? false,
//         constructionStatus: json['constructionStatus'] as String? ?? '',
//         channel: json['channel'] as String? ?? '',
//         description: json['description'] as String? ?? '',
//         title: json['title'] as String? ?? '',
//         price: json['price'] != null
//             ? Price.fromJson(json['price'] as Map<String, dynamic>)
//             : Price(display: ''),
//         propertyType: json['propertyType'] as String? ?? '',
//         mainImage: json['mainImage'] != null
//             ? MainImage.fromJson(json['mainImage'] as Map<String, dynamic>)
//             : MainImage(server: '', name: '', uri: ''));
//   }
// }

// class Lister {
//   final String website;
//   final String phoneNumber;
//   final String name;
//   final MainPhoto mainPhoto;
//   final String id;
//   final String email;

//   Lister({
//     required this.website,
//     required this.phoneNumber,
//     required this.name,
//     required this.mainPhoto,
//     required this.id,
//     required this.email,
//   });

//   factory Lister.fromJson(Map<String, dynamic> json) {
//     return Lister(
//       website: json['website'] as String? ?? '',
//       phoneNumber: json['phoneNumber'] as String? ?? '',
//       name: json['name'] as String? ?? '',
//       mainPhoto: json['mainPhoto'] != null
//           ? MainPhoto.fromJson(json['mainPhoto'] as Map<String, dynamic>)
//           : MainPhoto.empty(),
//       id: json['id'] as String? ?? '',
//       email: json['email'] as String? ?? '',
//     );
//   }

//   static Lister empty() => Lister(
//         website: '',
//         phoneNumber: '',
//         name: '',
//         mainPhoto: MainPhoto.empty(),
//         id: '',
//         email: '',
//       );
// }

// class MainPhoto {
//   final String server;
//   final String name;
//   final String uri;

//   MainPhoto({
//     required this.server,
//     required this.name,
//     required this.uri,
//   });

//   factory MainPhoto.fromJson(Map<String, dynamic> json) {
//     return MainPhoto(
//       server: json['server'] as String? ?? '',
//       name: json['name'] as String? ?? '',
//       uri: json['uri'] as String? ?? '',
//     );
//   }

//   static MainPhoto empty() => MainPhoto(server: '', name: '', uri: '');
// }

// class Price {
//   final String display;

//   Price({required this.display});

//   factory Price.fromJson(Map<String, dynamic> json) {
//     return Price(
//       // Add null check to "display" field and handle null value appropriately
//       display: json['display'] as String? ?? '',
//     );
//   }
// }

// class MainImage {
//   final String server;
//   final String name;
//   final String uri;

//   MainImage({
//     required this.server,
//     required this.name,
//     required this.uri,
//   });

//   factory MainImage.fromJson(Map<String, dynamic> json) {
//     return MainImage(
//       server: json['server'] as String? ?? '',
//       name: json['name'] as String? ?? '',
//       uri: json['uri'] as String? ?? '',
//     );
//   }
// }




// class Property {
//   String? purpose;
//   double? price;
//   String? title;
//   String? externalID;
//   CoverPhoto? coverPhoto;

//   Property(
//       {this.purpose, this.price, this.title, this.coverPhoto, this.externalID});

//   Property.fromJson(Map<String, dynamic> json) {
//     purpose = json['purpose'] ?? '';
//     price = json['price'] ?? 0;
//     title = json['title'] ?? '';
//     externalID = json['externalID'] ?? '';
//     coverPhoto = json['coverPhoto'] != null
//         ? CoverPhoto.fromJson(json['coverPhoto'])
//         : null;
//   }
// }

// class CoverPhoto {
//   int? id;
//   String? externalID;
//   String? title;
//   int? orderIndex;
//   double? nimaScore;
//   String? url;
//   bool? main;

//   CoverPhoto(
//       {this.id,
//       this.externalID,
//       this.title,
//       this.orderIndex,
//       this.nimaScore,
//       this.url,
//       this.main});

//   CoverPhoto.fromJson(Map<String, dynamic> json) {
//     id = json['id'] ?? 0;
//     externalID = json['externalID'] ?? '';
//     title = json['title'] ?? '';
//     orderIndex = json['orderIndex'] ?? 0;
//     nimaScore = json['nimaScore'] ?? 0.0;
//     url = json['url'] ?? '';
//     main = json['main'] ?? false;
//   }

//   // Rest of the code...
// }

