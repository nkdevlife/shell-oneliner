FROM ubuntu:20.04

# 環境変数の設定（非対話モード）
ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Tokyo \
    LANG=ja_JP.UTF-8

# 必要なパッケージを一括インストール
RUN apt-get update && \
    apt-get install -y tzdata language-pack-ja && \
    update-locale LANG=ja_JP.UTF-8 && \
    ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    echo "export LANG=ja_JP.UTF-8" >> ~/.bashrc

# man コマンドを有効化
RUN apt-get update && apt-get install -y man-db \

# 必要なツールをまとめてインストール
    git \
    vim \
    gawk \
    imagemagick \
    psmisc \
    parallel \
    rename \
    num-utils \
    pandoc
