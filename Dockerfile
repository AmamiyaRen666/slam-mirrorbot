FROM narima/megaria:local

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

COPY requirements.txt .
COPY extract /usr/local/bin
COPY pextract /usr/local/bin
RUN chmod +x /usr/local/bin/extract
RUN chmod +x /usr/local/bin/pextract
RUN pip3 install --no-cache-dir -r requirements.txt && chmod 777 /usr/lib/python3/dist-packages/*
COPY . .
COPY .netrc /root/.netrc
RUN chmod +x aria.sh

CMD ["bash","start.sh"]