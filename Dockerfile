FROM rust:1.93-bookworm AS builder

WORKDIR /src
COPY Cargo.toml Cargo.lock ./
COPY sandscope/Cargo.toml sandscope/Cargo.toml
COPY sandscope/src sandscope/src
RUN cargo build --locked --release --bin sandscope

FROM debian:bookworm-slim

ARG VERSION=dev
ARG REVISION=unknown
LABEL org.opencontainers.image.title="SandScope" \
      org.opencontainers.image.description="Dynamic security analysis for MCP tools and servers" \
      org.opencontainers.image.source="https://github.com/Wapiti08/sandscope" \
      org.opencontainers.image.version="${VERSION}" \
      org.opencontainers.image.revision="${REVISION}" \
      org.opencontainers.image.licenses="MIT"

RUN useradd --create-home --uid 10001 scanner
COPY --from=builder /src/target/release/sandscope /usr/local/bin/sandscope

USER scanner
WORKDIR /work
ENTRYPOINT ["/usr/local/bin/sandscope"]
CMD ["--help"]
