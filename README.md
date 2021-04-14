#  OpenSSLtest

## 개요 
NSString으로 받은 jwt token에서 payload의 data를 추출하는 로직입니다. 외부 라이브러리를 사용하지 않고 표준에서 지원하는 encodeBase64 함수를 이용하여 payload의 데이터를 추출합니다.<br>
현재 작성한 TokenParser 클래스는 예제를 끌어다가 사용했습니다.(출처: https://gist.github.com/AlexHedley/2b7d3b377e64f9407589ddf95b11ca1f)<br> 
인증을 위한 소스를 계속해서 추가할 예정입니다.<br>


## 기능
서버로부터 받은 jwt token에 대해 activation key를 추출하는 로직을 통해 해당 값을 얻습니다.<br>
activation key를 rsa 알고리즘으로 암호화 한 값을(16진수 문자열) 전송 서버의 파라미터로 사용합니다.<br>
activationKey를 request할 서버의 주소 파라미터로 사용합니다. jwtToken을 request하여 인증을 시도합니다.<br>

## 패치
21.04.6//jwt 토큰에서 payload를 추출하는 클래스를 추가했습니다.(payload의 activation key 추출) cocoapod OpenSSL을 이용하여 encode 로직을 구현했습니다.(미완)<br>
21.04.7//request 구현 중입니다. XAuthToken 생성 로직 구현을 마무리했습니다.<br>
21.04.8//request 구현 완료했습니다. response 작업 중 입니다.<br>
21.04.9//response 구현 완료했습니다. session을 작업하고 있습니다.<br>
~21.04.12//session(manager class) 구현 완료했습니다. 소스의 전체적인 흐름을 다시 구성하였습니다.





