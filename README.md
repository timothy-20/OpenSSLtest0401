#  OpenSSLtest

## 개요 
NSString으로 받은 jwt token에서 payload의 data를 추출하는 로직입니다. 외부 라이브러리를 사용하지 않고 표준에서 지원하는 encodeBase64 함수를 이용하여 payload의 데이터를 추출합니다.<br>
현재 작성한 소스는 예제를 따라 작성한 것에 불과합니다. 계속해서 소스를 추가할 예정입니다.<br>
(출처: https://gist.github.com/AlexHedley/2b7d3b377e64f9407589ddf95b11ca1f)

## 기능
서버로부터 받은 jwt token에 대해 activation key를 추출하는 로직을 통해 해당 값을 얻습니다.<br>
activation key를 rsa 알고리즘으로 암호화 한 값을(16진수 문자열로 받습니다.) 전송 서버의 파라미터로 사용합니다.<br>



