<!-- markdownlint-disable MD013 -->

# OpenCode Zen Models Overview

This document tracks which OpenCode Zen models are available in the current subscription (via `opencode models opencode --verbose`) along with their strengths, pricing, and recommended task mappings.

Last synced: 2026-09-24

## Overview

- Available models from `opencode models opencode --verbose` (current subscription — all limited-time free models):
  - General-purpose / stealth: `Big Pickle` (200K), `Space Bunny Free` (1M, stealth)
  - Fast & lightweight: `Ling 3.0 Flash Fin Free` (262K), `Nemotron 3.5 Lightning Free` (262K)
  - Reasoning & vision (multimodal): `MiMo-V2.6-Flash Free` (200K), `Muse Spark 1.2 Contributor Free` (1M), `Muse Spark 1.3 Contributor Free` (1M)
  - Deep reasoning: `Nemotron 3 Ultra Free` (1M)
- No paid models are exposed in the current subscription; the list above is the complete `opencode models opencode` output (8 models).
- Changes since 2026-09-20: added `MiMo-V2.6-Flash Free` (released 2026-09-22, replaces `MiMo-V2.5 Free`) and `Space Bunny Free` (released 2026-09-23, stealth, zero-retention); `MiMo-V2.5 Free` and `Jev 1.13 Free` no longer appear in `opencode models opencode` for this workspace (both remain available via Zen: `mimo-v2.5-free` at `/chat/completions` and `jev-1.13-free`/`jev-1.13` at `/systemone`).
- Free models are available for a limited time while the team collects feedback and improves the models.
- Billing is pay-as-you-go with per-token pricing (USD). Free models have no cost.

## Agent quick model map

Capability-first primary picks, with a lower-cost fallback (all free):

- **General-purpose coding and writing**: `Big Pickle` (primary), `Space Bunny Free` (1M stealth fallback) or `Ling 3.0 Flash Fin Free` (fast fallback).
- **Fast/repetitive tasks**: `Ling 3.0 Flash Fin Free` (primary, 262K, low/medium/high variants), `Nemotron 3.5 Lightning Free` (fallback, 262K).
- **Deep reasoning/debugging**: `Nemotron 3 Ultra Free` (primary, 1M context, 128K output), `Muse Spark 1.3 Contributor Free` (fallback, 1M) or `Space Bunny Free` (1M).
- **Multimodal/visual tasks**: `MiMo-V2.6-Flash Free` (primary, 200K, image/video/audio + reasoning), `Space Bunny Free` (fallback, image/video) or `Muse Spark 1.3 Contributor Free` (fallback, image/video/audio/pdf).
- **Agentic multi-step workflows**: `Big Pickle` (primary, 200K, toolcall+reasoning), `Nemotron 3 Ultra Free` (fallback, 1M) or `Space Bunny Free` (1M).
- **Structured decisions**: not in current `opencode models opencode` output — use `jev-1.13-free` (Free) or `jev-1.13` ($0.042/1M input) via `https://opencode.ai/zen/v1/systemone` for yes/no (`noul`), choice, and score questions.

## Models table

<!-- markdownlint-disable MD060 -->

| Model                           | Input | Output | Cached Read | Category               | Strengths                                                                                              | Status / Notes      | Provider            |
| ------------------------------- | ----- | ------ | ----------- | ---------------------- | ------------------------------------------------------------------------------------------------------ | ------------------- | ------------------- |
| Big Pickle                      | Free  | Free   | Free        | General-purpose        | Stealth model; 200K context (160K input / 32K output); reasoning + toolcall; free feedback period.     | Free (limited time) | OpenCode            |
| Ling 3.0 Flash Fin Free         | Free  | Free   | Free        | Fast & lightweight     | Open-weights; 262K context (32K output); fast with reasoning support (low/medium/high variants).       | Free (limited time) | InclusionAI         |
| MiMo-V2.6-Flash Free            | Free  | Free   | Free        | Reasoning & vision     | Open-weights; 200K context (32K output); vision/video/audio + reasoning; replaces MiMo-V2.5.           | Free (limited time) | Xiaomi              |
| Muse Spark 1.2 Contributor Free | Free  | Free   | Free        | Reasoning & vision     | Meta's model; 1M context (131K output); multimodal image/video/audio/pdf; prompts may train Meta models. | Free (limited time) | Meta                |
| Muse Spark 1.3 Contributor Free | Free  | Free   | Free        | Reasoning & vision     | Meta's model; 1M context (131K output); multimodal image/video/audio/pdf; prompts may train Meta models. | Free (limited time) | Meta                |
| Nemotron 3 Ultra Free           | Free  | Free   | Free        | Deep reasoning         | NVIDIA's largest model; 1M context (128K output); deep reasoning + toolcall.                           | Free (limited time) | NVIDIA              |
| Nemotron 3.5 Lightning Free     | Free  | Free   | Free        | Fast & lightweight     | NVIDIA's fast model; 262K context (262K output); reasoning + toolcall.                                 | Free (limited time) | NVIDIA              |
| Space Bunny Free                | Free  | Free   | Free        | General-purpose/vision | Stealth model; 1M context (524K input / 524K output); image/video + reasoning; zero-retention.         | Free (limited time) | OpenCode (stealth)  |

<!-- markdownlint-enable MD060 -->

No long-context surcharges apply to the current free models. All 8 models above are `$0` for input / cached read / output (see Pricing).

`MiMo-V2.5 Free` and `Jev 1.13 Free` remain listed at `https://opencode.ai/docs/zen/` and `https://opencode.ai/zen/v1/models` but are not in the current `opencode models opencode` output for this workspace.

## Availability & billing

- Billing is **pay-as-you-go**: you're charged per token (input, cached read, cached write, output) in USD.
- All models in the current subscription (`Big Pickle`, `Ling 3.0 Flash Fin Free`, `MiMo-V2.6-Flash Free`, `Muse Spark 1.2 Contributor Free`, `Muse Spark 1.3 Contributor Free`, `Nemotron 3 Ultra Free`, `Nemotron 3.5 Lightning Free`, `Space Bunny Free`) have **no cost** during the limited-time free period.
- `Muse Spark 1.2 Contributor Free` and `Muse Spark 1.3 Contributor Free` allow prompts and completions to be used for training future Meta models.
- `Space Bunny Free` is a stealth model whose provider follows a zero-retention policy and does not use your data for training (contrast with `Big Pickle`/`MiMo`/`Ling`/`Nemotron` free endpoints which may log use for feedback/improvement — see Privacy in Zen docs).
- `Jev 1.13` (paid, $0.042/1M input) and `Jev 1.13 Free` remain available via the SystemOne endpoint `https://opencode.ai/zen/v1/systemone` even when not listed in `opencode models opencode`.
- Credit card fees are passed along at cost (4.4% + $0.30 per transaction).
- Auto-reload: if your balance goes below $5, Zen automatically reloads $20 (configurable).

### Per-token pricing (per 1M tokens)

- Free models: $0 for all token classes (input, cached read, output) — no cached-write charge.
- No long-context surcharges apply to the current free models.
- Prompt caching is supported with cache read and cache write pricing (free tier = $0).
- Paid reference from `https://opencode.ai/docs/zen/` (not in current subscription): `Jev 1.13` at $0.042 input / Free output; all other Zen models are pay-as-you-go (e.g. `Muse Spark 1.2` $1.25/$4.25, `Muse Spark 1.3` $1.25/$4.25) — see Zen docs for full table.

## Quick recommendations by task

- **General-purpose coding & writing**: `Big Pickle`, `Space Bunny Free` (1M stealth alternative).
- **Fast / repetitive work**: `Ling 3.0 Flash Fin Free`, `Nemotron 3.5 Lightning Free`.
- **Deep reasoning & debugging**: `Nemotron 3 Ultra Free`, `Muse Spark 1.3 Contributor Free`, `Space Bunny Free`.
- **Working with visuals & multimodal prompts**: `MiMo-V2.6-Flash Free`, `Muse Spark 1.3 Contributor Free`, `Space Bunny Free`, `Muse Spark 1.2 Contributor Free`.
- **Agentic workflows**: `Big Pickle`, `Nemotron 3 Ultra Free`, `Space Bunny Free`.
- **Structured decisions / routing**: `Jev 1.13 Free` via SystemOne endpoint (not in current `opencode models opencode`; paid `Jev 1.13` also available).
- **Budget-friendly / free**: all 8 models above are free.

## Examples

- **Coding prompt**: "Write a Python function that normalizes timestamps, document it, and add pytest coverage." Recommended: `Big Pickle`, `MiMo-V2.6-Flash Free`.
- **README or docs**: "Generate a usage section with badges, CLI examples, and troubleshooting notes." Recommended: `Big Pickle`.
- **Zabbix config**: "Create a Zabbix item/trigger for disk occupancy > 85% with macros and recovery actions." Recommended: `Big Pickle` or `Ling 3.0 Flash Fin Free` (fast).
- **Ansible refactor**: "Refactor roles into a common collection and sync handlers across playbooks." Recommended: `Big Pickle`, `Nemotron 3 Ultra Free`.
- **Visual debugging**: "Analyze this screenshot of the UI and suggest CSS/layout fixes." Recommended: `MiMo-V2.6-Flash Free`, `Muse Spark 1.3 Contributor Free`, `Space Bunny Free` (all support image/video).
- **Structured routing**: "Classify each support ticket as urgent, returns, shipping, or billing." Recommended: `Jev 1.13 Free` via `https://opencode.ai/zen/v1/systemone` (choice question).
- **Long-running agent task**: "Analyze a large codebase, diagnose a cross-service deadlock, and implement a verified fix." Recommended: `Nemotron 3 Ultra Free` (1M context, 128K output), `Space Bunny Free` (1M, 524K output), `Muse Spark 1.3 Contributor Free` (1M) or `Big Pickle`.

## Updater prompt

```text
Run `opencode models opencode --verbose` to get the current list of available models (provider-filtered, structured JSON with cost/limit/capabilities).

Fetch the latest OpenCode Zen model pages at these URLs (source of truth for pricing/lifecycle; --verbose is cached models.dev data):
- https://opencode.ai/docs/zen/
- https://opencode.ai/zen/v1/models

Parse the pages for:
- per-token pricing (input / cached read / cached write / output per 1M tokens)
- model categories, strengths, and capabilities
- deprecation dates and limited-time free model status
- context window sizes and long-context surcharges

Update README_opencode_models.md using ONLY models that appear in the `opencode models opencode --verbose` output.
Preserve the top-level structure (Overview, Agent quick model map, Models table, Quick recommendations, Examples, Availability & billing, Updater prompt).
Mark deprecated models with the retirement date, and update examples if new capabilities are advertised.

After updating the README, regenerate models.opencode.json from the available model list:
- Use the exact provider IDs from `opencode models opencode --verbose` (e.g. `opencode/big-pickle`).
- Preserve the file structure: `$schema`, `model`, `small_model`, and `agent` keys for `plan`, `build`, `explore`, `implementer`, `code-reviewer`, `spec-reviewer`.
- Optimal flow: use a DIFFERENT model family for `code-reviewer` than `build`/`implementer` to avoid shared blind spots. Mapping:
  - `plan` -> strongest reasoning model
  - `build`/`implementer` -> strong coding model
  - `code-reviewer` -> strong reasoning from a DIFFERENT family than the builder
  - `spec-reviewer` -> strongest reasoning model
  - `explore` and `small_model` -> fast/lightweight
  - Consider free models for budget-conscious setups

Fix markdownlint issues in README_opencode_models.md
```

---

References:

- OpenCode Zen: [OpenCode Zen documentation](https://opencode.ai/docs/zen/)
- Models API: [OpenCode Zen models endpoint](https://opencode.ai/zen/v1/models)
- OpenCode Models config: [OpenCode Models documentation](https://opencode.ai/docs/models/)
