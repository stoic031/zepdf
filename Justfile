
set shell := ["bash", "-c"]

dev:
    @echo "🚀 Starting ZePDF in development mode..."
    cd app && cargo tauri dev

build:
    @echo "📦 Building ZePDF (release, current platform)..."
    cd app && cargo tauri build --release

build-mac-universal:
    @echo "🍎 Building universal macOS binary (Intel + Apple Silicon)..."
    cd app && cargo tauri build --target universal-apple-darwin --release

build-linux:
    @echo "🐧 Building for Linux (AppImage + deb)..."
    cd app && cargo tauri build --target x86_64-unknown-linux-gnu --release

lint:
    @echo "🔍 Running ESLint..."
    cd app && pnpm lint

format:
    @echo "🎨 Formatting with Prettier..."
    cd app && pnpm format

rust-fmt:
    cd app/src-tauri && cargo fmt

rust-clippy:
    cd app/src-tauri && cargo clippy -- -D warnings

rust-check:
    cd app/src-tauri && cargo check


kill-dev:
    @echo "🛑 Stopping dev processes..."
    -pkill -f "cargo tauri" 2>/dev/null || true
    -pkill -f "vite" 2>/dev/null || true
    -pkill -f "node.*vite" 2>/dev/null || true
    @echo "✅ Killed."

clean:
    @echo "🧹 Cleaning artifacts..."
    cd app && cargo clean
    rm -rf app/.svelte-kit app/dist app/node_modules/.vite
    pnpm store prune 2>/dev/null || true
    @echo "✅ Clean complete."

