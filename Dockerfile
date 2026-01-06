FROM python:3.10-slim

WORKDIR /app

# 安装系统依赖
RUN apt-get update && apt-get install -y     build-essential     curl     git     && rm -rf /var/lib/apt/lists/*

# 复制并安装 Python 依赖
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 复制项目代码
COPY . .

# 暴露端口 (假设后端是8000)
EXPOSE 8000

# 启动命令 (根据项目说明，通常是 bash start.sh)
CMD ["bash", "start.sh"]
