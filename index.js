const express = require('express');
//require() : 다른 node 모듈을 가져온다
const app = express();
const port = 8080;

app.use(express.static('public'));
//app.use : 정적 파일 추가

app.get('/', (req, res) => {
	res.send('Hello Node.js!');
    //app.get()메서드는 지정된 경로에 대한 모든 유형의 HTTP요청에 대해 실행함
});

app.listen(port, () => {
	console.log('Listening...');
    //app.listen([port[,host[,backlog]]][,callback])
    //app.listen() : 지정된 port,host로 접속할 수 있게 바인드 하고 대기한다.
    //"http.Server.listen()"과 같다.
});