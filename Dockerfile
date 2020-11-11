FROM elixir:1.9.4-alpine

# The name of your application/release (required)
ARG ShortUrl


# The environment to build with
ARG MIX_ENV=prod


# Set this to true if this release is not a Phoenix app
ARG SKIP_PHOENIX=false

RUN apk update && \
		apk upgrade --no-cache && \
		apk add bash openssl git make postgresql-client


ENV REPLACE_OS_VARS=true \
    APP_NAME=${APP_NAME}

# Install hex
RUN /usr/local/bin/mix local.hex --force && \
    /usr/local/bin/mix local.rebar --force && \
    /usr/local/bin/mix hex.info

RUN mix archive.install hex phx_new 1.4.14


# create a directory to bundle the application
WORKDIR /usr/app/

# ENV MIX_ENV=prod
COPY mix.exs mix.lock ./run.sh ./

EXPOSE 4000

RUN ["chmod", "+x", "/run.sh"]

CMD [ "./run.sh" ]