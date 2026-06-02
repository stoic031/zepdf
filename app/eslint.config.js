import js from "@eslint/js";
import ts from "typescript-eslint";
import svelte from "eslint-plugin-svelte";
import prettier from "eslint-config-prettier";
import globals from "globals";

/** @type {import('eslint').Linter.FlatConfig[]} */
export default ts.config(
  js.configs.recommended,
  ...ts.configs.recommended,

  ...svelte.configs["flat/recommended"],

  prettier,
  ...svelte.configs["flat/prettier"],

  {
    languageOptions: {
      globals: {
        ...globals.browser,
        ...globals.node,
        __TAURI__: "readonly",
      },
    },
  },

  {
    files: ["**/*.svelte"],
    languageOptions: {
      parserOptions: {
        parser: ts.parser,
        svelteFeatures: {
          experimentalGenerics: false,
        },
      },
    },
  },

  // Rule overrides
  {
    rules: {
      "@typescript-eslint/no-unused-vars": ["warn", { argsIgnorePattern: "^_" }],
      "@typescript-eslint/no-explicit-any": "warn",
      "svelte/valid-compile": "error",
    },
  },

  // Ignore patterns
  {
    ignores: [
      "node_modules/",
      ".svelte-kit/",
      "dist/",
      "build/",
      "static/",
      "src-tauri/",
      "src-tauri/target/",
      "src-tauri/gen/",
      "**/*.d.ts",
    ],
  },
);
