FROM weaveworks/flagger-loadtester:0.14.0

USER root

RUN apk update && apk add nodejs npm gettext
RUN npm install -g newman
RUN npm install postman-to-k6

COPY --from=loadimpact/k6:latest /usr/bin/k6 /usr/bin/k6

COPY pod-info.k6.js .
COPY pod-info.collection.json .
COPY libs ./libs

USER app