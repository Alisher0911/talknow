class User {
  final int id;
  final String name;
  final int age;
  final String city;
  final int distance;
  final List<String> imageURLs;

  User({
    required this.id,
    required this.name,
    required this.age,
    required this.city,
    required this.distance,
    required this.imageURLs,
  });

  static List<User> users = [
    User(
      id: 1, 
      name: "Sergey", 
      age: 21, 
      city: "Innopolis", 
      distance: 7, 
      imageURLs: [
        "https://img-fotki.yandex.ru/get/6436/244675082.51/0_10eb49_679c31ac_L.jpg", 
        "https://weproject.media/upload/medialibrary/d0b/d0b31cbe6f1d81684faebb31dc7d4786.jpeg",
      ]
    ),
    User(
      id: 2, 
      name: "Mika", 
      age: 19, 
      city: "Moscow", 
      distance: 520, 
      imageURLs: [
        "https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?cs=srgb&dl=pexels-andrea-piacquadio-733872.jpg&fm=jpg",
        "https://images.pexels.com/photos/38554/girl-people-landscape-sun-38554.jpeg?cs=srgb&dl=pexels-pixabay-38554.jpg&fm=jpg",
        "https://media.istockphoto.com/id/1129638608/photo/smiling-businesswoman-looking-at-camera-webcam-make-conference-business-call.jpg?s=612x612&w=0&k=20&c=NH4ZQvdy7E8Gnen21e50zgKjbZzgNygnrVzCI0E3u9o="
      ]
    ),
    User(
      id: 3, 
      name: "Maks", 
      age: 25, 
      city: "Omsk", 
      distance: 1040, 
      imageURLs: [
        "https://img.freepik.com/free-photo/waist-up-portrait-of-handsome-serious-unshaven-male-keeps-hands-together-dressed-in-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=2000",
      ]
    ),
    User(
      id: 4, 
      name: "Anna", 
      age: 18, 
      city: "Innopolis", 
      distance: 2, 
      imageURLs: [
        "https://media.istockphoto.com/id/1129638608/photo/smiling-businesswoman-looking-at-camera-webcam-make-conference-business-call.jpg?s=612x612&w=0&k=20&c=NH4ZQvdy7E8Gnen21e50zgKjbZzgNygnrVzCI0E3u9o=",
        "https://sakamknigi.mk/wp-content/uploads/2015/07/woman-07.jpg",
        "https://cdn.stocksnap.io/img-thumbs/280h/woman-smartphone_MLEPUKHYUU.jpg"
      ]
    ),
  ];
}