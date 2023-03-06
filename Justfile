set dotenv-load
set positional-arguments

run *ARGS:
    cargo run -- "$@"

test *ARGS:
    cargo test --features postgres,sqlite,uuid,json,chrono,runtime-tokio-rustls -- "$@"

build:
    cargo build

install:
    cargo install --path .

check:
    cargo check
