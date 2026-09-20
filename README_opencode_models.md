<!-- markdownlint-disable MD013 -->

# OpenCode Zen Models Overview

This document tracks which OpenCode Zen models are available in the current subscription (via `opencode models`) along with their strengths, pricing, and recommended task mappings.

Last synced: 2026-09-20

## Overview

- Available models from `opencode models` (current subscription — all limited-time free models):
  - General-purpose: `Big Pickle`
  - Structured decisions: `Jev 1.13 Free`
  - Fast & lightweight: `Ling 3.0 Flash Fin Free`, `Nemotron 3.5 Lightning Free`
  - Reasoning & vision: `MiMo-V2.5 Free`, `Muse Spark 1.2 Contributor Free`, `Muse Spark 1.3 Contributor Free`
  - Deep reasoning: `Nemotron 3 Ultra Free`
- No paid models are exposed in the current subscription; the list above is the complete `opencode models` output.
- Free models are available for a limited time while the team collects feedback and improves the models.
- Billing is pay-as-you-go with per-token pricing (USD). Free models have no cost.

## Agent quick model map

Capability-first primary picks, with a lower-cost fallback (all free):

- **General-purpose coding and writing**: `Big Pickle` (primary), `Ling 3.0 Flash Fin Free` (fast fallback).
- **Fast/repetitive tasks**: `Ling 3.0 Flash Fin Free` (primary), `Nemotron 3.5 Lightning Free` (fallback).
- **Deep reasoning/debugging**: `Nemotron 3 Ultra Free` (primary), `MiMo-V2.5 Free` (fallback).
- **Multimodal/visual tasks**: `MiMo-V2.5 Free` (primary), `Muse Spark 1.3 Contributor Free` (fallback).
- **Agentic multi-step workflows**: `Big Pickle` (primary), `Nemotron 3 Ultra Free` (fallback).
- **Structured decisions**: `Jev 1.13 Free` (yes/no, choice, and score questions).

## Models table

<!-- markdownlint-disable MD060 -->

| Model                          | Input | Output | Cached Read | Category             | Strengths                                                                     | Status / Notes      | Provider    |
| ------------------------------ | ----- | ------ | ----------- | -------------------- | ----------------------------------------------------------------------------- | ------------------- | ----------- |
| Big Pickle                     | Free  | Free   | Free        | General-purpose      | Stealth model; free during limited-time feedback period.                       | Free (limited time) | OpenCode    |
| Jev 1.13 Free                  | Free  | Free   | Free        | Structured decisions | System One model; evaluates state against yes/no, choice, and score questions. | Free (limited time) | TypeSafe AI |
| Ling 3.0 Flash Fin Free        | Free  | Free   | Free        | Fast & lightweight   | Open-weights; fast with reasoning support.                                     | Free (limited time) | InclusionAI |
| MiMo-V2.5 Free                 | Free  | Free   | Free        | Reasoning & vision   | Open-weights; supports vision and reasoning.                                   | Free (limited time) | Xiaomi      |
| Muse Spark 1.2 Contributor Free| Free  | Free   | Free        | Reasoning & vision   | Meta's model; prompts/completions may train future Meta models.                | Free (limited time) | Meta        |
| Muse Spark 1.3 Contributor Free| Free  | Free   | Free        | Reasoning & vision   | Meta's model; prompts/completions may train future Meta models.                | Free (limited time) | Meta        |
| Nemotron 3 Ultra Free          | Free  | Free   | Free        | Deep reasoning       | NVIDIA's largest model; 1M context.                                            | Free (limited time) | NVIDIA      |
| Nemotron 3.5 Lightning Free    | Free  | Free   | Free        | Fast & lightweight   | NVIDIA's fast model; 262K context.                                             | Free (limited time) | NVIDIA      |

<!-- markdownlint-enable MD060 -->

No long-context surcharges apply to the current free models.

## Availability & billing

- Billing is **pay-as-you-go**: you're charged per token (input, cached read, cached write, output) in USD.
- All models in the current subscription (`Big Pickle`, `Jev 1.13 Free`, `Ling 3.0 Flash Fin Free`, `MiMo-V2.5 Free`, `Muse Spark 1.2 Contributor Free`, `Muse Spark 1.3 Contributor Free`, `Nemotron 3 Ultra Free`, `Nemotron 3.5 Lightning Free`) have **no cost** during the limited-time free period.
- `Muse Spark 1.2 Contributor Free` and `Muse Spark 1.3 Contributor Free` allow prompts and completions to be used for training future Meta models.
- Credit card fees are passed along at cost (4.4% + $0.30 per transaction).
- Auto-reload: if your balance goes below $5, Zen automatically reloads $20 (configurable).

### Per-token pricing (per 1M tokens)

- Free models: $0 for all token classes (input, cached read, output).
- No long-context surcharges apply to the current free models.
- Prompt caching is supported with cache read and cache write pricing.

## Quick recommendations by task

- **General-purpose coding & writing**: `Big Pickle`.
- **Fast / repetitive work**: `Ling 3.0 Flash Fin Free`, `Nemotron 3.5 Lightning Free`.
- **Deep reasoning & debugging**: `Nemotron 3 Ultra Free`, `MiMo-V2.5 Free`.
- **Working with visuals & multimodal prompts**: `MiMo-V2.5 Free`, `Muse Spark 1.3 Contributor Free`.
- **Agentic workflows**: `Big Pickle`, `Nemotron 3 Ultra Free`.
- **Structured decisions / routing**: `Jev 1.13 Free`.
- **Budget-friendly / free**: all models above are free.

## Examples

- **Coding prompt**: "Write a Python function that normalizes timestamps, document it, and add pytest coverage." Recommended: `Big Pickle`, `MiMo-V2.5 Free`.
- **README or docs**: "Generate a usage section with badges, CLI examples, and troubleshooting notes." Recommended: `Big Pickle`.
- **Zabbix config**: "Create a Zabbix item/trigger for disk occupancy > 85% with macros and recovery actions." Recommended: `Big Pickle` or `Ling 3.0 Flash Fin Free` (fast).
- **Ansible refactor**: "Refactor roles into a common collection and sync handlers across playbooks." Recommended: `Big Pickle`, `Nemotron 3 Ultra Free`.
- **Visual debugging**: "Analyze this screenshot of the UI and suggest CSS/layout fixes." Recommended: `MiMo-V2.5 Free`, `Muse Spark 1.3 Contributor Free`.
- **Structured routing**: "Classify each support ticket as urgent, returns, shipping, or billing." Recommended: `Jev 1.13 Free`.
- **Long-running agent task**: "Analyze a large codebase, diagnose a cross-service deadlock, and implement a verified fix." Recommended: `Nemotron 3 Ultra Free` (1M context) or `Big Pickle`.

## Updater prompt

```text
Run `opencode models` to get the current list of available models.

Fetch the latest OpenCode Zen model pages at these URLs:
- https://opencode.ai/docs/zen/
- https://opencode.ai/zen/v1/models

Parse the pages for:
- per-token pricing (input / cached read / cached write / output per 1M tokens)
- model categories, strengths, and capabilities
- deprecation dates and limited-time free model status
- context window sizes and long-context surcharges

Update README_opencode_models.md using ONLY models that appear in the `opencode models` output.
Preserve the top-level structure (Overview, Agent quick model map, Models table, Quick recommendations, Examples, Availability & billing, Updater prompt).
Mark deprecated models with the retirement date, and update examples if new capabilities are advertised.

After updating the README, regenerate models.opencode.json from the available model list:
- Use the exact provider IDs from `opencode models` (e.g. `opencode/big-pickle`).
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
