# 使用官方的 Java 运行时作为基础镜像
FROM azul/zulu-openjdk:17-latest

# 设置工作目录
WORKDIR /app

# 将本地编译好的 jar 包复制到容器中
COPY target/BiliLiveRecorder.jar app.jar

# 设置环境变量，调整 JVM 参数
ENV JAVA_OPTS="-Xmx512m -Xms256m"

# 测试变量
ENV TEST_VIDEO="debug=false&check=false&delete=false&liver=douyu&id=1126960&qn=0&retry=5"

# 定义容器启动时执行的命令
CMD ["sh", "-c", "java $JAVA_OPTS -Dfile.encoding=utf-8 $TEST_VIDEO -jar app.jar"]

# 暴露应用端口
EXPOSE 8080
