import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Dio _dio = Dio();

  Future<Response> fetchPosts() async {
    // JSONPlaceholder에서 데이터 가져오기
    try {
      final response = await _dio.get('https://jsonplaceholder.typicode.com/posts');
      return response;
    } catch (e) {
      throw Exception('Failed to load posts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Profiling',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Network Example'),
        ),
        body: FutureBuilder<Response>(
          future: fetchPosts(), // Future를 호출
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              final List posts = snapshot.data!.data; // API 응답 데이터
              return ListView.builder(
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(posts[index]['title']),
                    subtitle: Text(posts[index]['id'].toString()),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

//설명
// fetchPosts 함수:
//
// Dio 객체를 사용해 API 요청을 보냅니다.
// 예외 처리 (try-catch)를 통해 에러 발생 시 사용자에게 적절히 알립니다.
// FutureBuilder:
//
// future 매개변수에 fetchPosts를 전달하여 비동기 데이터를 처리합니다.
// snapshot 상태를 기반으로 로딩, 성공, 또는 에러 화면을 다르게 렌더링합니다.
// snapshot.data:
//
// Dio의 응답 데이터는 Response 객체로 반환됩니다.
// snapshot.data!.data는 JSON 데이터(List)를 참조합니다.