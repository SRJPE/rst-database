FROM postgres:13

RUN mkdir app/
COPY * app/