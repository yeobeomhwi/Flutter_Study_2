import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Memory Profiling',
      home: Scaffold(
          appBar: AppBar(
            title: Text('Memory Example'),
          ),
          body: HomeScreen()),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: CachedNetworkImage(
            imageUrl: 'https://picsum.photos/200/300?random=$index',
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ), // 로딩 중 표시
            errorWidget: (context, url, error) => const Icon(
              Icons.error,
              color: Colors.red,
            ), // 오류 시 아이콘 표시
          ),
        );
      },
    );
  }
}





//flutter_cache_manager의 효과:
//
// 이미지를 다운로드한 후 로컬 스토리지에 저장합니다.
// 동일한 이미지를 다시 로드할 때 로컬 캐시에서 이미지를 불러오므로 네트워크 요청이 줄어듭니다.
// 메모리 사용량이 GC 이후 안정적으로 유지됩니다.
// 성능 개선 결과:
//
// Image.network로 매번 새로 요청했을 때와 비교하여 네트워크 호출 횟수 감소.
// 메모리 사용량 분석 결과:
// 캐싱 전: 이미지가 증가할수록 메모리 사용량 꾸준히 증가.
// 캐싱 후: 메모리 사용량이 일정 수준으로 유지.

//flutter_cache_manager 사용 원리
// flutter_cache_manager 패키지는 네트워크에서 이미지를 다운로드한 후 로컬 디스크에 저장.
//
// 이미지 캐시 사용:
// 캐시된 파일은 지정된 만료 시간(기본 7일)까지 유지.
// 캐시된 파일이 있으면 네트워크를 다시 호출하지 않고 로컬 파일에서 이미지를 로드.
//
// cached_network_image는 내부적으로 flutter_cache_manager를 사용하여 네트워크 요청을 줄이고 메모리를 효율적으로 관리.



