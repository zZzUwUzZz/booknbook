const VERSION = 'version 1.0'

//서비스 워커 설치할 경우
self.addEventListener('install', event => {
    console.log('service worker - install', VERSION)

    //제어 중인 서비스 워커가 존재해도 대기 상태를 건너뛴다. 
    self.skipWaiting()
})

//서비스 워커 설치 중일 때
self.addEventListener('activate', event => {
    console.log('service worker - activate', VERSION)

    //활성화 즉시 클라이언트를 제어한다.
    self.clients.clients()

})