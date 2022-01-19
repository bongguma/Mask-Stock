# Mask-Stock
📕 위치별 마스크 재고 검색 앱 📕

### 📕 위치별 마스크 재고 검색 앱 📕
*백업용 URL을 마스크 재고 API로 활용하여 마스크 재고를 확인하는 앱을 Flutter MVVM패턴으로 구현*   

#### 사용될 기술
1. 마스크 재고 API를 사용할 수 있도록 HTTP 통신
2. 위치를 정보를 제공하는 기술
3. Provider를 활용한 상태 관리
4. 구글 지도 오픈 라이브러리를 활용한 기술

#### MVVM (Model - View - ViewModel) 패턴
[View] - 사용자에게 보여주는 UI 부문
          - 사용자의 동작이나 각종 처리는 ViewModel에서 이루어진다.
[ViewModel] - Model을 View에 표시하기 위한 처리를 하는 부문
                - View로 부터 미션 받은 처리를 Model에게 전달해줄 수 있다.
                - Model로 받은 처리 결과를 View에 전달해줄 수 있다.
[Model] - 데이터와 데이터를 처리하는 부문
            - ViewModel로 부터 받은 미션을 해결하는 로직 작업을 진행한다.
            - DB, File로 부터 데이터를 가져오거나 전송해주는 역할을 한다. 


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
