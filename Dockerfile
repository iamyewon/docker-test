FROM node:18

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . ./

EXPOSE 3000

CMD ["npm", "start"]



# FROM 본인 노드 실행환경 (위의 노드를 사용하지 않아도 되지만, 모든 노드 앱의 일치하는 부분이 있다)
# WORKDIR : 작업 디렉토리를 정의
# COPY 필요한 파일을 복사
# RUN 리액트의 필요한 파일을 인스톨
# COPY 프로젝트의 나머지 부분을 복사
# EXPOSE 컨테이너에 특정 포트를 수신



# 각각의 명령어들은 한줄 한줄씩 캐싱되어 실행된다.
# package.json의 내용은 자주 바뀌진 않을 거지만
# 소스 코드는 자주 바뀌는데
# npm install과 COPY . . 를 동시에 수행하면
# 소스 코드가 조금 달라질때도 항상 npm install을 수행해서 리소스가 낭비된다.



# [1] 빌드 : docker build -f Dockerfile -t test-docker . 
# [2] 실행 : docker run -d -p 3006:3000 test-docker
# [3] 이미지명 변경(도커허브 리포지토리명으로) : docker tag test-docker:latest jin0kim326/docker-example:latest
# [4] 도커 로그인 (push를위해) : docker login
# [5] 푸시 : docker push jin0kim326/docker-example:latest

# REFERNECE 
# 1. Docker기본 강의 (엘리) : https://www.youtube.com/watch?v=LXJhA3VWXFA
# 2. React 도커 : https://velog.io/@oneook/Docker%EB%A1%9C-React-%EA%B0%9C%EB%B0%9C-%EB%B0%8F-%EB%B0%B0%ED%8F%AC%ED%95%98%EA%B8%B0