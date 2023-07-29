set dotenv-load
set positional-arguments

run *ARGS:
    cargo run -- "$@"

test *ARGS:
    cargo test --all-features -- "$@"

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
    cargo publish --all-features

patch:
    just version patch
    just publish
