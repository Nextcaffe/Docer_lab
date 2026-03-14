FROM alpine:3.14 AS builder

RUN apk add --no-cache g++ musl-dev upx && \
    mkdir cpp_project

COPY ./cpp_project ./cpp_project

RUN g++ -static -Os -s \
    cpp_project/Cryptographer.h cpp_project/Cryptographer.cpp \
    cpp_project/File_interaction.h cpp_project/File_interaction.cpp \
    cpp_project/main_console.cpp -o app && \
    upx --best app

    
FROM scratch
COPY --from=builder /app /app

CMD ["./app"]