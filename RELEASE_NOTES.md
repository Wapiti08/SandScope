# SandScope v0.1.0-alpha.2

This release migrates the project and published artifacts to the SandScope name.

- CLI and Cargo package: `sandscope`
- Container image: `ghcr.io/wapiti08/sandscope:v0.1.0-alpha.2`
- Configuration overrides: `SANDSCOPE_BIN` and `SANDSCOPE_PYTHON_WASM`
- Source directory: `sandscope/`

Update scripts and image references that used the previous name. Existing alpha.1 artifacts remain unchanged. This release also includes dependency updates and the fixture logging security fix from main.

Highlights:

- WASM/WASI sandboxed scans and native MCP stdio monitoring
- structured source, sink, flow, execution, and protocol telemetry
- labeled evaluation suites across Rust, Go, Python, and TypeScript
- binaries for Linux, macOS, and Windows
- `linux/amd64` and `linux/arm64` image at `ghcr.io/wapiti08/sandscope:v0.1.0-alpha.2`

This is an alpha. Review the [threat model](https://github.com/Wapiti08/sandscope/blob/v0.1.0-alpha.2/THREAT_MODEL.md), especially the native-execution and detection limitations, before scanning untrusted servers.

See the [changelog](https://github.com/Wapiti08/sandscope/blob/v0.1.0-alpha.2/CHANGELOG.md) for the complete release summary.
