# ZePDF

> A modern, fast, and privacy-first desktop PDF reader built with Rust, Tauri v2, and Svelte 5.

## 🌟 Features

- ⚡ **Native Performance**: Powered by `pdfium-render` and Rust for lightning-fast PDF processing
- 🖥️ **Cross-Platform Desktop**: Tauri v2 delivers a lightweight, secure native experience
- 🎨 **Modern UI**: Built with Svelte 5 + TypeScript + Tailwind CSS v4
- 🔒 **Privacy-First**: 100% local processing, zero telemetry or cloud dependencies
- 🛠️ **Reproducible Dev Env**: Nix-powered toolchain, deterministic builds
- ✅ **Strict Code Quality**: ESLint 9, Prettier, Husky v9 + lint-staged, `cargo fmt/clippy`

## 📦 Tech Stack

| Layer               | Technology                                                                                                |
| ------------------- | --------------------------------------------------------------------------------------------------------- |
| **Desktop Core**    | [Tauri v2](https://v2.tauri.app/) + Rust                                                                  |
| **Frontend**        | [Svelte 5](https://svelte.dev/) + TypeScript + [Vite](https://vite.dev/)                                  |
| **Styling**         | [Tailwind CSS v4](https://tailwindcss.com/)                                                               |
| **PDF Engine**      | [`pdfium-render`](https://github.com/ajrcarey/pdfium-render), [`lopdf`](https://github.com/J-F-Liu/lopdf) |
| **Dev Environment** | [Nix](https://nixos.org/) (flake), `direnv`, `pnpm`                                                       |
| **Tooling**         | `just`, `husky v9`, `lint-staged`, ESLint 9, Prettier                                                     |

## 🗂️ Project Structure
'''
zepdf/
├── app/ # Tauri + Svelte frontend workspace
│ ├── src/ # Svelte routes, components, UI logic
│ ├── src-tauri/ # Rust backend, Tauri commands, Cargo.toml
│ ├── package.json # Frontend dependencies & scripts
│ └── ...
├── flake.nix # Nix dev shell (Rust, Node, toolchain)
├── Justfile # Unified task runner for dev/build/lint
└── README.md
'''
## 🚀 Quick Start

### Prerequisites

- [Nix](https://nixos.org/download/) package manager
- `direnv` (optional, highly recommended)

### Setup

```bash
git clone https://github.com/<your-username>/zepdf.git
cd zepdf

# Enter Nix dev environment
nix develop
# Or: direnv allow

# Install frontend dependencies
cd app && pnpm install
```

### Development

```bash
just dev          # Start Tauri + Vite dev server
just fmt          # Format + lint Rust & frontend code
just check        # Run type checks & clippy
just build        # Build release binary for current platform
```

## 📝 Development Workflow

This project uses a strict pre-commit hook setup via `husky v9` + `lint-staged`:

- ✅ Auto-formats `.svelte`, `.ts`, `.js` with Prettier & ESLint
- ✅ Runs `cargo fmt` on staged Rust files
- ❌ Blocks commits with unresolved lint/type errors

> 💡 Skip hooks in emergencies: git commit --no-verify -m "..."

## 🌍 Roadmap

- Core PDF viewer with zoom/scroll/navigation
- Advanced annotation & highlighting
- PDF merge/split/watermark via lopdf
- Text extraction & OCR integration
- Cloud sync & account system (zepdf.com)
- Plugin/extension system

## 📄 License

This project is licensed under the MIT License.
