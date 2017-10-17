# Perfect Lunch
TDD 스터디의 연장으로 TDD를 적용하여 간단한 서비스 개발

[http://pathfinder-lunch.object.so](http://pathfinder-lunch.object.so)

[![Build Status](https://travis-ci.com/jaemyeong/PathfinderLunch.svg?token=p1jPjhuHKegMuyKF59XB&branch=master)](https://travis-ci.com/jaemyeong/PathfinderLunch)

## 1회차(2017-08-08)
- [x] 점식 먹을 식당을 무작위로 고르는 프로그램
- [x] 등록된 식당 1개 이상 있어야한다
- [x] 식당끼리 비교가 가능한가?
- [x] 식당 클래스의 생성자가 필요함

## 2회차(2017-08-22)
- [x] 응답이 JSON으로 와야한다.
- [x] UTF-8 문제를 해결해야 한다.
- [x] 식당을 등록할 수 있어야 한다.
- [x] 식당을 수정할 수 있어야한다.
- [x] 식당을 삭제할 수 있어야한다.
- [x] 식당 이름으로 식당을 가져올 수 있어야 한다

## 3회차(2017-09-19)
- [x] Xcode 9 호환성 개선

## 4회차(2017-10-10)
- [x] 식당을 영속화 시켜야한다.
	- [x] C
	- [x] R
	- [x] U
	- [x] D
- [x] Lunch 클래스에서 CRUD

## 5회차
- [x] Restful API 엔드포인트
	- [x] Fetch all
	- [x] Add one
	- [x] Fetch one
	- [x] Delete one
	- [x] Patch one
- [ ] 식당이 중복될 경우 처리
- [ ] Lunch의 items 접근성 수정
- [ ] 없는 식당을 수정 할 때 처리
- [ ] Slack 연동
- [ ] 랜덤테스트 개선을 해야됨

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
* [Server Side Swift - Perfect](http://perfect.org/) - 이거 안씀 구림
* [Random Data Generator in Swift - RandomKit](https://nvzqz.github.io/RandomKit/docs/)
* [Vapor (Server-side Swift)](https://vapor.codes)

#TDD
