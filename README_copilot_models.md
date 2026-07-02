# GitHub Copilot Models Overview

This document mirrors the GitHub Copilot AI model docs to keep the team aware of which models are supported, their strengths, and the right task for each.

Last synced: 2026-07-02

## Overview

- GitHub Copilot supports general-purpose, fast/lightweight, deep reasoning, agentic, and multimodal variants. Each category balances latency, reasoning, and multimodal context support.
- New models since last sync: `Claude Fable 5`, `Claude Opus 4.8` (plus a `fast mode` preview), `Claude Sonnet 5`, `MAI-Code-1-Flash` (Microsoft), and `Kimi-K2.7-Code` (Moonshot AI). `Raptor mini` and `Gemini 3.5 Flash` are now GA.
- Closing down 2026-06-01: `GPT-4.1`, `GPT-5.2`, and `GPT-5.2-Codex`. `Claude Opus 4.6 (fast mode)` retires 2026-06-29 (replaced by `Claude Opus 4.8 (fast mode)`).
- Retired models (already removed): `Grok Code Fast 1` (2026-05-15), `Claude Sonnet 4` (2026-05-01), `GPT-5.1` (2026-04-15), all GPT-5.1-Codex variants (2026-04-01), `Gemini 3 Pro` (2026-03-26).
- Billing is now usage-based: interactions consume tokens that convert to GitHub AI Credits (1 credit = $0.01 USD). Premium-request multipliers are legacy and apply only to existing annual Pro/Pro+ request-based plans.

## Agent quick model map

- **General-purpose coding and writing**: `GPT-5 mini` (primary), `MAI-Code-1-Flash` (fallback).
- **Fast/repetitive tasks**: `Claude Haiku 4.5` (primary), `Gemini 3 Flash` (fallback).
- **Deep reasoning/debugging**: `GPT-5.5` (primary), `Claude Opus 4.8` (fallback).
- **Multimodal/visual tasks**: `GPT-5 mini` (primary), `Claude Sonnet 4.6` (fallback).
- **Agentic multi-step workflows**: `GPT-5.3-Codex` (primary), `Claude Fable 5` (fallback).

## Models table

| Model | Provider | Category | Strengths | Status |
| --- | --- | --- | --- | --- |
| GPT-4.1 | OpenAI | General-purpose coding & writing | Fast, accurate code completions. | Closing down: 2026-06-01 |
| GPT-5 mini | OpenAI | General-purpose multimodal | Fast, accurate completions with visuals. | GA |
| GPT-5.2 | OpenAI | Deep reasoning & debugging | Multi-step problem solving, architecture analysis. | Closing down: 2026-06-01 |
| GPT-5.2-Codex | OpenAI | Agentic | Agentic software development. | Closing down: 2026-06-01 |
| GPT-5.3-Codex | OpenAI | Agentic | Higher-quality codegen for features, tests, debugging, refactors. | GA |
| GPT-5.4 | OpenAI | Deep reasoning & debugging | Complex reasoning across architectures. | GA |
| GPT-5.4 mini | OpenAI | Agentic | Codebase exploration with grep-style tools. | GA |
| GPT-5.4 nano | OpenAI | Inline suggestions | Codex VS Code extension only (Pro+ only). | GA |
| GPT-5.5 | OpenAI | Deep reasoning & debugging | Complex reasoning, code analysis, technical decision-making. | GA |
| Raptor mini | Fine-tuned GPT-5 mini | General-purpose / fast inline suggestions | Fast, accurate inline completions and explanations. | GA |
| MAI-Code-1-Flash | Microsoft | General-purpose & fast | Strong instruction-following; reliable default for everyday coding. | GA |
| Kimi-K2.7-Code | Moonshot AI | General-purpose & agentic | Fast, reliable answers to lightweight coding questions. | GA |
| Claude Haiku 4.5 | Anthropic | Fast & lightweight | Quick answers to lightweight coding questions. | GA |
| Claude Fable 5 | Anthropic | Long-horizon autonomous coding | First-attempt correctness, parallel tool batching, proactive verification. | GA (opt-in; see note) |
| Claude Opus 4.5 | Anthropic | Deep reasoning & debugging | Sophisticated reasoning. | GA |
| Claude Opus 4.6 | Anthropic | Deep reasoning & debugging | Anthropic's powerful reasoning model. | GA |
| Claude Opus 4.7 | Anthropic | Deep reasoning & debugging | Complex problem-solving, sophisticated reasoning. | GA |
| Claude Opus 4.8 | Anthropic | Deep reasoning & debugging | Anthropic's most powerful model. | GA |
| Claude Opus 4.8 (fast mode) | Anthropic | Deep reasoning & debugging | Fast mode preview. | Public preview |
| Claude Sonnet 4.5 | Anthropic | Multimodal & agentic | Structured outputs for reasoning tasks. | GA |
| Claude Sonnet 4.6 | Anthropic | Multimodal & agentic | Reliable completions, 1M-token context, configurable reasoning. | GA |
| Claude Sonnet 5 | Anthropic | Multimodal & agentic | Improved general-purpose coding and agent tasks. | GA |
| Gemini 2.5 Pro | Google | Deep reasoning & debugging | Complex generation and debugging. | GA |
| Gemini 3 Flash | Google | Fast & lightweight | Fast responses to lightweight coding questions. | Public preview |
| Gemini 3.1 Pro | Google | Deep reasoning & visual | Efficient edit-then-test loops with high tool precision. | Public preview |
| Gemini 3.5 Flash | Google | Fast & lightweight | Fast, reliable answers to lightweight coding questions. | GA |

> **Note on Claude Fable 5**: When Fable 5 is used, Anthropic retains prompts and outputs to operate safety classifiers. Enterprise and business admins must enable the model before it becomes available.

## Quick recommendations by task

- **General-purpose coding & writing**: `GPT-5 mini`, `GPT-5.3-Codex`, `Raptor mini`, and `MAI-Code-1-Flash` balance quality, speed, and multimodal context.
- **Fast / repetitive work**: `Claude Haiku 4.5`, `MAI-Code-1-Flash`, `Gemini 3 Flash`, `Gemini 3.5 Flash`, and `Raptor mini` keep latency low.
- **Deep reasoning & debugging**: `GPT-5.4`, `GPT-5.5`, `Claude Opus 4.7`, `Claude Opus 4.8`, `Claude Sonnet 4.6`, `Gemini 2.5 Pro`, and `Gemini 3.1 Pro` tackle multi-file investigations.
- **Working with visuals & multimodal prompts**: `GPT-5 mini`, `Claude Sonnet 4.6`, and `Gemini 3.1 Pro` handle screenshots/diagrams.
- **Agentic workflows**: `GPT-5.3-Codex`, `GPT-5.4 mini`, `Claude Fable 5`, and `Kimi-K2.7-Code` automate PR creation and multi-file edits.

## Examples

- **Coding prompt**: "Write a Python function that normalizes timestamps, document it, and add pytest coverage." Recommended models: `GPT-5 mini`, `GPT-5.3-Codex`, `MAI-Code-1-Flash`.
- **README or docs**: "Generate a usage section with badges, CLI examples, and troubleshooting notes." Recommended: `GPT-5 mini`.
- **Zabbix config**: "Create a Zabbix item/trigger for disk occupancy > 85% with macros and recovery actions." Recommended: `Claude Haiku 4.5` or `Claude Opus 4.7`.
- **Ansible refactor**: "Refactor roles into a common collection and sync handlers across playbooks." Recommended: `GPT-5.3-Codex` or `GPT-5.4 mini`.
- **Visual debugging**: "Analyze this screenshot of the UI and suggest CSS/layout fixes." Recommended: `GPT-5 mini`, `Claude Sonnet 4.6`, or `Gemini 3.1 Pro`.
- **Deep reasoning**: "Debug an inter-service deadlock with logs across three services." Recommended: `GPT-5.5`, `Claude Opus 4.8`, or `Gemini 2.5 Pro`.

## Availability & billing

- All supported models are available across Copilot Free, Pro, Pro+, Max, Business, and Enterprise plans (subject to model policies and admin opt-ins).
- Copilot Chat auto-selects the best model by default; manually override if you want a specific model. Paid plans get a discount when using the **Auto** option.
- Billing is **usage-based**: interactions consume input, cached, and output tokens that convert to GitHub AI Credits (**1 AI credit = $0.01 USD**). Included allowances vary by plan; usage beyond the allowance is billed at the per-token rates below.
- Code completions and next edit suggestions are **not** billed in AI credits and remain unlimited on paid plans.
- Premium-request multipliers are **legacy** and apply only to existing annual Pro/Pro+ subscribers on request-based billing.

### Per-token pricing (per 1M tokens)

| Model | Provider | Input | Cached input | Output |
| --- | --- | ---: | ---: | ---: |
| GPT-5 mini | OpenAI | $0.25 | $0.025 | $2.00 |
| GPT-5.3-Codex | OpenAI | $1.75 | $0.175 | $14.00 |
| GPT-5.4 | OpenAI | $2.50 | $0.25 | $15.00 |
| GPT-5.4 (long context > 272K) | OpenAI | $5.00 | $0.50 | $22.50 |
| GPT-5.4 mini | OpenAI | $0.75 | $0.075 | $4.50 |
| GPT-5.4 nano | OpenAI | $0.20 | $0.02 | $1.25 |
| GPT-5.5 | OpenAI | $5.00 | $0.50 | $30.00 |
| GPT-5.5 (long context > 272K) | OpenAI | $10.00 | $1.00 | $45.00 |
| Claude Haiku 4.5 | Anthropic | $1.00 | $0.10 | $5.00 |
| Claude Sonnet 4.5 | Anthropic | $3.00 | $0.30 | $15.00 |
| Claude Sonnet 4.6 | Anthropic | $3.00 | $0.30 | $15.00 |
| Claude Sonnet 5 | Anthropic | $2.00 | $0.20 | $10.00 |
| Claude Opus 4.5 | Anthropic | $5.00 | $0.50 | $25.00 |
| Claude Opus 4.6 | Anthropic | $5.00 | $0.50 | $25.00 |
| Claude Opus 4.7 | Anthropic | $5.00 | $0.50 | $25.00 |
| Claude Opus 4.8 | Anthropic | $5.00 | $0.50 | $25.00 |
| Claude Opus 4.8 (fast mode) | Anthropic | $10.00 | $1.00 | $50.00 |
| Claude Fable 5 | Anthropic | $10.00 | $1.00 | $50.00 |
| Gemini 2.5 Pro | Google | $1.25 | $0.125 | $10.00 |
| Gemini 3 Flash | Google | $0.50 | $0.05 | $3.00 |
| Gemini 3.1 Pro | Google | $2.00 | $0.20 | $12.00 |
| Gemini 3.1 Pro (long context > 200K) | Google | $4.00 | $0.40 | $18.00 |
| Gemini 3.5 Flash | Google | $1.50 | $0.15 | $9.00 |
| Raptor mini | Fine-tuned (GitHub) | $0.25 | $0.025 | $2.00 |
| MAI-Code-1-Flash | Microsoft | $0.75 | $0.075 | $4.50 |
| Kimi-K2.7-Code | Moonshot AI | $0.95 | $0.19 | $4.00 |

- Anthropic models also incur a cache-write cost (e.g. $1.25 for Haiku 4.5, $3.75 for Sonnet 4.x, $6.25 for Opus, $12.50 for Fable 5 / Opus 4.8 fast mode).
- `Claude Sonnet 5` pricing is promotional through 2026-08-31.

## Updater prompt

```text
Fetch the latest GitHub Copilot model pages at these URLs:
- https://docs.github.com/en/copilot/reference/ai-models/supported-models
- https://docs.github.com/en/copilot/reference/ai-models/model-comparison
- https://docs.github.com/en/copilot/reference/copilot-billing/models-and-pricing

Parse the pages for:
- current list of supported models and release/preview/retirement status
- per-token pricing (input / cached input / output per 1M tokens) and AI-credit conversion
- recommended task mappings and any new model categories (agentic, multimodal, flash/mini variants)

Update README_copilot_models.md preserving the top-level structure (Overview, Models table, Quick recommendations by task, Examples, Availability & billing, Updater prompt).
Add or remove models as the docs indicate, mark retiring models with the retirement date, and update examples if new capabilities (e.g., multimodal image input) are advertised.
Fix markdownlint issues in README_copilot_models.md
```

---

References:

- Supported models: [GitHub Copilot -- Supported models](https://docs.github.com/en/copilot/reference/ai-models/supported-models)
- Model comparison: [GitHub Copilot -- Model comparison](https://docs.github.com/en/copilot/reference/ai-models/model-comparison)
- Models and pricing: [GitHub Copilot -- Models and pricing](https://docs.github.com/en/copilot/reference/copilot-billing/models-and-pricing)
