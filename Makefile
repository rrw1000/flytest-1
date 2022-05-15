TARGET_CC='x86_64-linux-nusl-gcc'
export TARGET_CC

#TARGET_CFLAGS="-I $(pwd)/usr/include/x86_64-linux-gnu -isystem$(pwd)/usr/include"
CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER=x86_64-linux-musl-gcc
export CARGO_TARGET_X86_64_UNKNOWN_LINUX_MUSL_LINKER

all:
	cargo build --release --target x86_64-unknown-linux-musl
	cp target/x86_64-unknown-linux-musl/release/flytest docker/flytest
	podman build --arch amd64 --tag fly-test-1 docker
