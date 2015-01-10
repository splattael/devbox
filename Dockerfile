FROM debian:wheezy
MAINTAINER Peter Suschlik <peter@suschlik.de>

ENV DEBIAN_FRONTEND noninteractive

RUN echo 'deb http://http.debian.net/debian wheezy-backports main' >> /etc/apt/source.list

RUN apt-get update
RUN apt-get install -y vim-nox screen git ruby ruby-dev make
RUN apt-get clean
RUN gem install --no-rdoc --no-ri rake

WORKDIR /root
RUN git clone https://github.com/splattael/dotfiles .dotfiles

WORKDIR /root/.dotfiles
RUN echo "a" | rake install
RUN rake update

WORKDIR /root/.dotfiles/vim/bundle/Command-T/ruby/command-t
RUN ruby extconf.rb
RUN make

RUN mkdir /src
VOLUME /src
WORKDIR /src
