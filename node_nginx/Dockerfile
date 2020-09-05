FROM fengh0409/nginx:v1.16.0

ADD https://nodejs.org/dist/v10.16.0/node-v10.16.0-linux-arm64.tar.xz /usr/local/src

RUN cd /usr/local/src/node-v10.16.0-linux-x64 \
    && ln -sf /usr/local/src/node-v10.16.0-linux-x64/bin/node /usr/local/bin/ \
    && ln -sf /usr/local/src/node-v10.16.0-linux-x64/bin/npm /usr/local/bin/ \
    && rm -rf node-v10.16.0-linux-x64.tar 

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org && \
	ln -sf /usr/local/src/node-v10.16.0-linux-x64/lib/node_modules/cnpm/bin/cnpm /usr/local/bin/
