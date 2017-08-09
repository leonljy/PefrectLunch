# 완전한 점심 [TDD Study]

TDD 스터디의 연장으로 TDD를 적용하여 간단한 서비스 개발

[http://pathfinder-lunch.object.so](http://pathfinder-lunch.object.so)

## 1회차(2017-08-08)
- [x] 점식 먹을 식당을 무작위로 고르는 프로그램
- [x] 등록된 식당 1개 이상 있어야한다
- [x] 식당끼리 비교가 가능한가?
- [x] 식당 클래스의 생성자가 필요함

## 2회차
- [ ] 식당을 등록할 수 있어야 한다.
- [ ] 응답이 JSON으로 와야한다.
- [ ] 식당을 영속화 시켜야한다.
- [ ] UTF-8 문제를 해결해야 한다.
- [ ] 식당을 삭제할 수 있어야한다.
- [ ] 식당을 수정할 수 있어야한다.

## 시작하기

### macOS
```
$ git clone https://github.com/jaemyeong/PathfinderLunch.git
$ cd PathfinderLunch
$ swift package generate-xcodeproj
$ open PathfinderLunch.xcodeproj
```

## 빌드
Release 빌드
```
$ swift build -c release -Xswiftc -static-stdlib
```

## 레퍼런스
* [Server Side Swift - Perfect](http://perfect.org/)
* [Random Data Generator in Swift - RandomKit](https://nvzqz.github.io/RandomKit/docs/)
