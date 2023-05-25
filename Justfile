set dotenv-load
set positional-arguments

run *ARGS:
    cargo run -- "$@"

test *ARGS:
    cargo test --features postgres,sqlite,uuid,json,chrono,decimal,runtime-tokio-rustls -- "$@"

build:
    cargo build

install:
    cargo install --path .

check:
    cargo check

version VERSION:
    cargo set-version --bump {{ VERSION }}
    git commit Cargo.toml -m "Version bump"

publish:
    cargo publish -F runtime-tokio-rustls,postgres,chrono

patch:
    just version patch
    just publish
