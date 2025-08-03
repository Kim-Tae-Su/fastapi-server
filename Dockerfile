# 파이썬 공식 이미지를 기반으로 사용합니다.
FROM python:3.11-slim

# 작업 디렉토리를 설정합니다.
WORKDIR /app

# 의존성 파일을 복사하고 설치합니다.
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 애플리케이션 코드를 복사합니다.
# project-root/final 디렉토리의 모든 내용을 컨테이너의 /app 디렉토리로 복사합니다.
COPY . /app

# FastAPI 애플리케이션이 실행될 포트를 노출합니다.
EXPOSE 8000

# 서버를 실행하는 명령어입니다.
# main.py 파일이 /app 디렉토리 아래에 있으므로,
# 모듈 경로는 "main:app" 그대로 사용합니다.
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]