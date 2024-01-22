import 'package:dio/dio.dart';

import '../models/post.dart';
Dio dio = Dio();
CancelToken cancelToken = CancelToken();

String baseUrlEmbedded = 'http://192.168.0.101/x2/wp-json/wp/v2/';


String postsEndPoint = 'posts?_embed';
String categoriesEndPoint = 'categories';
String categoriesPostsEndPoint = 'posts?categories=';
String pagesEndpoint ='pages';


List<Post> posts = [];
List categories = [];
List categoryPosts =[];
List pages=[];
