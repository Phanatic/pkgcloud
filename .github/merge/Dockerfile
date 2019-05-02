FROM alpine:3.6

LABEL version="1.0.0"
LABEL repository="http://github.com/actions/npm"
LABEL homepage="http://github.com/actions/npm"
LABEL maintainer="Phani Raj <support+actions@github.com>"

LABEL com.github.actions.name="Merge PR"
LABEL com.github.actions.description="Merges the current PR"
LABEL com.github.actions.icon="git-merge"
LABEL com.github.actions.color="green"
RUN apk update && \
	apk add curl jq
COPY "entrypoint.sh" "/entrypoint.sh"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["help"]
