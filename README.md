# 🌌 Lucent
집중과 감정의 흐름을 기록하는 몰입 타이머 앱  
타이머, 감정 기록, 감성 시각화(성운)를 통해 나만의 리듬을 만들어보세요

## 주요 기능

- ⏱️ **집중 타이머**: 몰입을 위한 직관적인 타이머
- 😌 **감정 기록**: 집중 후 감정을 선택하고 회고를 남김
- 🌌 **감정 성운**: 감정들이 별로 시각화되어 떠오름
- 🗂️ **히스토리 리스트**: 날짜순 세션 확인 및 삭제 가능

## 아키텍처

- SwiftUI + MVVM + Clean Architecture
- UseCase / Repository / ViewModel 계층 분리
- SOLID 원칙 (DIP, SRP 중심)

## 기술 스택

| 계층 | 기술 / 도구 |
|------|-------------|
| UI | SwiftUI, Combine |
| 비동기 | Swift Concurrency (async/await) |
| 설계 | MVVM, Clean Architecture |
| 데이터 | UserDefaults (로컬 저장), Codable |
| 테스트 | (예정) XCTest, UnitTest

## 향후 개선 예정

- ✅ 성운 클릭 시 상세 회고 보기
- ✅ 테스트 코드 도입
- ✅ 집중 흐름 기반 UI/UX 개선
- ✅ 감정별 통계/분석 기능

---

## 프로젝트 구조 (요약)
```
Lucent/
├── Core/
├── Domain/
│   ├── Entity/
│   ├── UseCase/
│   └── Repository/
├── Data/
│   └── Repository/
├── Presentation/
│   ├── View/
│   ├── ViewModel/
│   ├── Component/
│   └── Tab/
├── Resources/
└── Extensions/
```

