FROM node:alpine

# STEP 1: These are always good to install: wget, tar, curl, bash, unzip
#         and install ruby version of sass (since the npm version doesn't go well with alpine)
RUN apk add --update wget tar curl bash unzip \
  && apk add --update build-base libffi-dev ruby ruby-dev \
  && gem install sass compass --no-ri --no-rdoc \
  && apk del build-base libffi-dev ruby-dev \
  && rm -rf /var/cache/apk/*

# STEP 2: install the handlebars command line
RUN npm install --global handlebars

# STEP 3: install Gulp with Yarn
RUN apk add --quiet --no-cache bash git \
  && yarn global add bower gulp \
  && yarn cache clean \
  && rm -rf /var/cache/apk/* /tmp/*

# RUN npm install --global sass
# RUN npm install --global gulp-sass

# STEP 5: Set the entrypoint and run it
  WORKDIR /workdir
  VOLUME /workdir

CMD ["/bin/bash"]
