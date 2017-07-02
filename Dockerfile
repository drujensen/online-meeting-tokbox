# if your building this on a small t2 instance, you may need a swapfile to build kgen
# sudo dd if=/dev/zero of=/swapfile bs=2k count=512k && sudo mkswap /swapfile && sudo chmod 600 /swapfile && sudo swapon /swapfile
# sudo sudo swapoff /swapfile && sudo rm /swapfile

FROM drujensen/crystal:0.22.0-1

ENV KGEN_VERSION 0.7.3

RUN curl -L https://github.com/kemalyst/kemalyst-generator/archive/v$KGEN_VERSION.tar.gz | tar xvz -C /usr/local/share/. && cd /usr/local/share/kemalyst-generator-$KGEN_VERSION && crystal deps && make

RUN ln -s /usr/local/share/kemalyst-generator-$KGEN_VERSION/bin/kgen /usr/local/bin/kgen

WORKDIR /app/user

ADD . /app/user

RUN crystal deps

RUN crystal build --release src/online-meeting.cr

CMD ["online-meeting"]
