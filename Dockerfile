# 选择一个有 curl 和 tar 的基础镜像
FROM alpine:latest

# 设置工作目录
WORKDIR /app

# 更新软件包并安装所需的软件
RUN apk update && apk add --no-cache curl tar

# 下载 ninja 并解压到 /bin
RUN curl -L https://github.com/gngpp/ninja/releases/download/v0.9.26/ninja-0.9.26-x86_64-unknown-linux-musl.tar.gz | tar zx \
    && mv ninja /bin/ninja

# 复制本地的配置文件 serve.toml 到容器
COPY serve.toml /app/serve.toml

# 配置文件 serve.toml 是自己提供的

# 暴露容器内部使用的端口
EXPOSE 7999

# 挂载卷，如果需要持久化日志或其他数据
# VOLUME /你的数据目录

# 运行 ninja 指向配置文件 serve.toml。根据需要配置 CMD/ENTRYPOINT
# 注意下面的命令只是例子，具体运行、启动方法根据实际情况来设定
CMD ["ninja", "run", "-C", "/app/serve.toml"]

# 请按照自己的实际情况替换里面的 “你的端口号” 和 “/你的数据目录” ，以及 CMD 里的命令。
# 如果 serve.toml 中已包含了运行配置，CMD 命令可能不需要。
