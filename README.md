# 🚄 Trainy App - 기차 예매 앱

Flutter로 개발된 기차 예매 시뮬레이션 앱입니다. 출발역과 도착역을 선택하고 좌석을 예매할 수 있는 간단하고 직관적인 인터페이스를 제공합니다.

## ✨ 주요 기능

- **역 선택**: 출발역과 도착역을 선택할 수 있습니다
- **좌석 예매**: 선택한 구간의 좌석을 확인하고 예매할 수 있습니다
- **다크 모드 지원**: 라이트/다크 테마를 지원합니다
- **반응형 UI**: 다양한 화면 크기에 대응하는 반응형 디자인

## 🛠 기술 스택

- **Framework**: Flutter 3.8.0+
- **Language**: Dart
- **Platforms**: Android, iOS, Web, Windows, macOS, Linux

## 📁 프로젝트 구조

```
lib/
├── main.dart                 # 앱 진입점
├── util/
│   └── station.dart         # 역 정보 데이터
└── view/
    ├── page/
    │   ├── home_page.dart   # 메인 홈 페이지
    │   ├── seat_page.dart   # 좌석 선택 페이지
    │   └── station_list_page.dart # 역 목록 페이지
    └── widget/
        ├── seat_tile.dart   # 좌석 타일 위젯
        └── submit_button.dart # 제출 버튼 위젯
```

## 🎯 주요 페이지

### 1. 홈 페이지 (`home_page.dart`)

- 출발역과 도착역 선택
- 직관적인 UI로 역 선택 가능
- 선택된 역 정보 표시
- **스마트 역 필터링**: 출발역으로 선택된 역은 도착역 목록에서 제외, 도착역으로 선택된 역은 출발역 목록에서 제외하여 중복 선택 방지

### 2. 역 목록 페이지 (`station_list_page.dart`)

- 사용 가능한 역 목록 표시
- 출발역/도착역에 따라 필터링된 목록 제공

### 3. 좌석 선택 페이지 (`seat_page.dart`)

- 선택한 구간의 좌석 현황 표시
- 좌석 예매 기능

## 🚉 지원 역

현재 지원하는 역 목록:

- 수서
- 동탄
- 평택지제
- 천안아산
- 오송
- 대전
- 김천구미
- 동대구
- 경주
- 울산
- 부산

## 🎨 UI/UX 특징

- **Material Design**: Google의 Material Design 가이드라인 준수
- **다크 모드**: 시스템 설정에 따른 자동 테마 전환
- **반응형 레이아웃**: 다양한 화면 크기 지원
- **직관적인 네비게이션**: 사용자 친화적인 화면 전환

## 🔧 개발 환경 설정

### Flutter 설치

```bash
# Flutter SDK 설치 후
flutter doctor
```

### IDE 설정

- Android Studio 또는 VS Code 사용 권장
- Flutter 및 Dart 플러그인 설치

## 학습기록

- https://www.notion.so/Flutter-3377d32b3bda4878abd1bb2763b523fa

---

**Trainy App** - 기차 예매를 더욱 간편하게! 🚄✨
