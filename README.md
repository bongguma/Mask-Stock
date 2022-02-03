# Mask-Stock

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
                
      _changeNotifer & chageNotiferProvider_
          - ViewModel 클래스가 changeNotifer를 상속을 받아 사용해 구현하고 있다면,
            View 안에서 ChangeNotiferProvider를 통해 변경점이 변경 시 위젯이 변경될 수 있다. 
            ViewModel를 공통지어 여러 곳에 쓸 떄 유용하다는 것을 알 수 있다. 
            이 때, ChangeNotiferProvider를 위젯트리 최상단에 위치하게 하면 된다.
            
            NotifyListener() : ViewModel 안에서 데이터가 변경 될 경우, 메소드를 통해 알린다.
            Provider.of<ChangeNotifer>(context) : 변경된 위젯을 자동 갱신 진행
            
                
[Model] - 데이터와 데이터를 처리하는 부문 _(현재 프로젝트 패키지에서는 service 명칭을 사용 중에 있음)_
            - ViewModel로 부터 받은 미션을 해결하는 로직 작업을 진행한다.
            - DB, File로 부터 데이터를 가져오거나 전송해주는 역할을 한다. 
            
   
**Flutter의 Provider 라이브러**
    - 구글이 추천하는 상태관리(전역에서 사용하는 데이터를 관리) 라이브러리 
    - 기존에는 setState에 의해 하위 모든 위젯이 다시 리빌드 되었다면,
      provider 사용 시에는 꼭 필요한 위젯만 다시 그려질 수 있게 된다.  (성능 향상)

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
