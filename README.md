# SikDDoRak 🍱 
🍽 편식쟁이들을 위한 맞춤형 밀키트 주문 키오스크 프로토타입 🍽
<br>아이디어 개략 흐름 및 개발 기술 검토(초안설계/개발 기간 3일)
<br><br>

## ADS 초안

- 알레르기나 음식 성향 등 각자의 사정으로 편식을 하는 사람들이 밀키트를 자신의 기호에 맞게 재료를 커스텀하여 구매할 수 있는 키오스크 앱

<br>

## 페르소나
- 밀키트로 간편하게 만드는 부대찌개를 먹고 싶은데, 햄 알레르기가 있어 먹기 어려운 사람
- 채식주의자라 고기 없는 된장찌개를 먹고 싶은 사람
- 원하는 재료만 넣어 편식하고 싶은 사람

<br>
  
## 구현 목표
- 밀키트를 커스터마이징 할 수 있도록 키오스크 플랫폼 개발
- Xcode로 UIKit 기반의 앱 프로젝트 생성

<br>

## 실행환경
- Xcode 15.2
- iPadOs 17.0

<br>

## 실행 방법
1. Git 프로젝트를 Clone한다
2. 프로젝트 폴더의 Sikdorak-iOS.xcodeproj 프로젝트 파일을 Xcode로 열기
3. Xcode의 Run으로 실행

<br>
  
## 단계별 사용자 시나리오

<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB5/assets/152110747/4fcc0f06-4e64-4b10-b405-e34972db3a1f" width="50%">


### 초기 진입화면
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB5/assets/49361214/37b0d15d-9cb4-450f-91e9-ca42c4135fa4" width="50%">   

- 키오스크의 감성을 살리고자 추가했습니다.
- 화면 아무 곳을 터치하면 메뉴 선택화면으로 넘어갑니다.

<br>

### 메뉴 선택화면
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB5/assets/49361214/60ee9df2-340d-49f0-96b2-9a93b1bff575" width="50%">  

- 원하는 밀키트를 선택할 수 있습니다.
- 밀키트를 선택하면 재료 선택화면으로 넘어갑니다.
- 재료 선택까지 완료한 밀키트는 장바구니에 담깁니다.
- 주문하기 버튼을 누르면 결제화면으로 넘어갑니다.

<br>

### 재료 선택화면
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB5/assets/49361214/55134132-7fdd-421a-9190-69f233f42fb7" width="49%">
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB5/assets/49361214/a14dffad-ca61-48dd-aa89-b86b473fa39b" width="49%">  

- 선택한 밀키트의 맵기 정도나 재료를 선택할 수 있습니다.
- 선택 완료를 누르면 메뉴 선택화면으로 돌아갑니다.

<br>

### 결제화면
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB5/assets/49361214/60017c9f-eab5-4ca6-b297-37ccfd1a294a" width="50%">  

- 장바구니에 담긴 밀키트 목록을 다시 한 번 확인할 수 있습니다
- 밀키트의 이름, 맵기, 토핑, 사리, 합계 가격 등의 정보를 볼 수 있습니다.
- 결제하기 버튼을 누르면 결제 완료 안내 Alert를 띄워줍니다.

<br>

### 결제 완료 안내
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB5/assets/49361214/d237bef8-ec20-4258-8575-eb50c390d4da" width="49%">  
<img src="https://github.com/APP-iOS4/UIKit-Prototype-LAB5/assets/49361214/f76814ba-b98f-4604-aad4-7e66a48ba796" width="49%">  

- 결제 완료 안내 메시지를 띄워줍니다.
- 화면 아무 곳을 터치하면 초기 진입화면으로 돌아갑니다.

<br>

-----

<br>
  
## 아직 더 해봐야할 것들 (미구현된 목표)
- 재료 선택을 완료하면 장바구니에 담기는 기능
- 재료 선택 기능 및 수량 조정 기능
- 재료 중복선택 기능
- 장바구니 삭제 기능

<br>
  
## 간단하게 원하는 재료만 선택하고 편식하세요! 
- 당신이 원하는 대로 맞춤형 밀키트를 제공합니다.
- 여러분의 취향에 맞춘 밀키트 Sikdorak 과 함께 
- 맛있는 여정을 떠나보세요! 🥬🌽🥓🥘🍱

<br>

## 5조 조원 이름
- 심상원 [@Upcircle2](https://github.com/Upcircle2)
######
- 유승재 [@seungjaeyuu](https://github.com/seungjaeyuu)
######
- 유지호 [@jihoooo97](https://github.com/jihoooo97)
######
- 최준영 [@Devjunnn](https://github.com/Devjunnn)

<br>

# Notice
- 이미지 문제 시, 삭제하도록 하겠습니다.

<br>

# License
Copyright 멋쟁이사자처럼 Lab5. All rights reserved.

Licensed under the [MIT](LICENSE) license.

<br><br>


