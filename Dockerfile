FROM alpine:3.14

RUN apk add build-base && \
    mkdir cpp_project

COPY ./cpp_project ./cpp_project

RUN g++ cpp_project/Cryptographer.h cpp_project/Cryptographer.cpp \
    cpp_project/File_interaction.h cpp_project/File_interaction.cpp \
    cpp_project/main_console.cpp -o app && \
    rm -r cpp_project &&\
    apk del build-base

CMD ["/app"]