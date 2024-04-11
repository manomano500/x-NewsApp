import 'package:dio/dio.dart';

import '../models/post.dart';
Dio dio = Dio();
CancelToken cancelToken = CancelToken();


String host ="192.168.215.136";
String WordPressProjectName ="x2";
String baseUrlEmbedded = 'http://$host/$WordPressProjectName/wp-json/wp/v2/';


String postsEndPoint = 'posts?_embed';
String categoriesEndPoint = 'categories';
String categoriesPostsEndPoint = 'posts?categories=';
String pagesEndpoint ='pages';


List<Post> posts = [];
List categories = [];
List categoryPosts =[];
List pages=[];
