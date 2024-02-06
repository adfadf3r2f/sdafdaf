# 选择一个有 curl 和 tar 的基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 更新软件包并安装所需的软件
RUN apk update && apk add --no-cache curl tar

# 下载 ninja 并解压到 /bin
RUN curl -L https://github.com/gngpp/ninja/releases/download/v0.9.26/ninja-0.9.26-x86_64-unknown-linux-musl.tar.gz | tar zx \
    && mv ninja /bin/ninja


# 暴露容器内部使用的端口
EXPOSE 7999


CMD ["ninja", "run", "--enable-webui", "--arkose-endpoint", "https://asdfdfs.zeabur.app"] 

