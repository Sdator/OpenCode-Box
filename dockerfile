FROM oven/bun:debian

RUN apt-get update && apt-get install -y git openssh-client ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /app
ENV BUN_INSTALL="/root/.bun"
ENV PATH="$BUN_INSTALL/bin:$PATH"

RUN bun add -g opencode-ai

EXPOSE 8086

CMD ["opencode","web", "--port", "8086", "--hostname", "0.0.0.0"]
