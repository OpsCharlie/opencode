<!-- markdownlint-disable MD013 -->

# GitHub Copilot Models Overview

This document tracks which GitHub Copilot models are available in the current subscription (via `opencode models | grep github-copilot`) along with their strengths, pricing, and recommended task mappings.

Last synced: 2026-09-03

## Overview

- Available models from `opencode models | grep github-copilot`:
  - OpenAI: `GPT-5 mini`, `GPT-5.3-Codex`, `GPT-5.4`, `GPT-5.4 mini`, `GPT-5.5`, `GPT-5.6 Luna`, `GPT-5.6 Sol`, `GPT-5.6 Terra`
  - Anthropic: `Claude Haiku 4.5`, `Claude Sonnet 5`, `Claude Opus 4.7`/`4.7-fast`/`4.8`/`4.8-fast`/`5`
  - Google: `Gemini 3.5 Flash`, `Gemini 3.6 Flash`, `Gemini 3.7 Flash`
- Extended capabilities include longer context windows and configurable reasoning levels on supported models.
- No currently available model is marked for retirement in GitHub's supported-model documentation.
- Billing is usage-based: interactions consume tokens that convert to GitHub AI Credits (1 credit = $0.01 USD).

## Agent quick model map

Capability-first primary picks, with a lower-cost fallback:

- **General-purpose coding and writing**: `Claude Sonnet 5` (primary), `GPT-5 mini` (fast/low-cost fallback).
- **Fast/repetitive tasks**: `GPT-5.6 Luna` (primary), `Claude Haiku 4.5` (fallback).
- **Deep reasoning/debugging**: `Claude Opus 5` (primary), `GPT-5.5` (fallback).
- **Multimodal/visual tasks**: `GPT-5 mini`.
- **Agentic multi-step workflows**: `Claude Sonnet 5` (primary), `GPT-5.3-Codex` (fallback).

## Models table

<!-- markdownlint-disable MD060 -->

| Model                                    | Input  | Output | Category                   | Strengths                                                         | Status / Notes               | Provider  |
| ---------------------------------------- | ------ | ------ | -------------------------- | ----------------------------------------------------------------- | ---------------------------- | --------- |
| GPT-5 mini                               | $0.25  | $2.00  | General-purpose multimodal | Fast, reliable default for coding/writing; supports visual input. | GA                           | OpenAI    |
| GPT-5.3-Codex                            | $1.75  | $14.00 | Codex / agentic            | High-quality codegen for refactors, tests, multi-file diffs.      | GA                           | OpenAI    |
| GPT-5.4                                  | $2.50  | $15.00 | Deep reasoning & debugging | Complex reasoning; 1M-context and configurable reasoning.         | GA                           | OpenAI    |
| GPT-5.4 (long context > 272K)            | $5.00  | $22.50 | Deep reasoning & debugging | Complex reasoning; 1M-context and configurable reasoning.         | GA                           | OpenAI    |
| GPT-5.4 mini                             | $0.75  | $4.50  | Agentic                    | Agentic dev; effective with grep-style codebase exploration.      | GA                           | OpenAI    |
| GPT-5.5                                  | $5.00  | $30.00 | Deep reasoning & debugging | Complex reasoning, code analysis, technical decisions.            | GA                           | OpenAI    |
| GPT-5.5 (long context > 272K)            | $10.00 | $45.00 | Deep reasoning & debugging | Complex reasoning, code analysis, technical decisions.            | GA                           | OpenAI    |
| GPT-5.6 Luna                             | $0.20  | $1.20  | Fast & lightweight         | Low-cost, low-latency lightweight coding answers.                 | GA                           | OpenAI    |
| GPT-5.6 Luna (long context > 200K)       | $0.40  | $1.80  | Fast & lightweight         | Low-cost, low-latency lightweight coding answers.                 | GA                           | OpenAI    |
| GPT-5.6 Sol                              | $2.00  | $10.00 | Deep reasoning & debugging | Powerful reasoning; promo pricing through 2026-09-03.             | GA                           | OpenAI    |
| GPT-5.6 Sol (long context > 272K, promo) | $4.00  | $15.00 | Deep reasoning & debugging | Powerful reasoning; promo pricing through 2026-09-03.             | GA                           | OpenAI    |
| GPT-5.6 Terra                            | $2.00  | $12.00 | Coding & agentic           | Versatile coding/agent model.                                     | GA                           | OpenAI    |
| GPT-5.6 Terra (long context > 272K)      | $4.00  | $18.00 | Coding & agentic           | Versatile coding/agent model.                                     | GA                           | OpenAI    |
| Claude Haiku 4.5                         | $1.00  | $5.00  | Fast & lightweight         | Fast responses at good quality for small tasks.                   | GA                           | Anthropic |
| Claude Opus 4.7                          | $5.00  | $25.00 | Deep reasoning & debugging | Complex problem solving and sophisticated reasoning.              | GA                           | Anthropic |
| Claude Opus 4.7 (fast)                   | –      | –      | Deep reasoning & debugging | Faster Opus 4.7 variant exposed by the current subscription.      | Not separately documented    | Anthropic |
| Claude Opus 4.8                          | $5.00  | $25.00 | Deep reasoning & debugging | Complex problem solving and sophisticated reasoning.              | GA                           | Anthropic |
| Claude Opus 4.8 (fast)                   | $10.00 | $50.00 | Deep reasoning & debugging | Faster Opus 4.8 variant for sophisticated reasoning.              | GA (fast mode preview)       | Anthropic |
| Claude Opus 5                            | $5.00  | $25.00 | Deep reasoning & debugging | Anthropic's newest, most powerful reasoning model.                | GA                           | Anthropic |
| Claude Sonnet 5                          | $2.00  | $10.00 | Coding & agentic           | Strong coding/agent model; 1M-context.                            | GA                           | Anthropic |
| Gemini 3.5 Flash                         | $1.50  | $9.00  | Fast & lightweight         | Low-latency lightweight coding answers.                           | GA                           | Google    |
| Gemini 3.6 Flash                         | $0.75  | $3.75  | Fast & lightweight         | Fast, reliable answers to lightweight coding questions.           | GA; promo through 2026-12-31 | Google    |
| Gemini 3.7 Flash                         | $0.75  | $3.75  | Fast & lightweight         | Fast, reliable answers to lightweight coding questions.           | GA; promo through 2026-12-31 | Google    |

<!-- markdownlint-enable MD060 -->

## Availability & billing

- Billing is **usage-based**: interactions consume input, cached, and output tokens that convert to GitHub AI Credits (**1 AI credit = $0.01 USD**). Included allowances vary by plan; usage beyond the allowance is billed at the per-token rates below.
- Code completions and next edit suggestions are **not** billed in AI credits and remain unlimited on paid plans.

### Per-token pricing (per 1M tokens)

- Anthropic models incur a cache-write cost in addition to cached input; OpenAI's earlier models (GPT-5 mini through GPT-5.5) and Google models do not, but GPT-5.6 Luna/Sol/Terra do.
- `GPT-5.6 Sol` pricing is promotional (50% off standard rates) through 2026-09-03.
- `Gemini 3.6 Flash` and `Gemini 3.7 Flash` pricing is promotional through 2026-12-31.

## Quick recommendations by task

- **General-purpose coding & writing**: `Claude Sonnet 5`, `GPT-5.3-Codex`, `GPT-5.6 Terra`, then `GPT-5 mini` as a fast default.
- **Fast / repetitive work**: `GPT-5.6 Luna`, `Claude Haiku 4.5`, `Gemini 3.5 Flash`, `Gemini 3.6 Flash`, `Gemini 3.7 Flash`.
- **Deep reasoning & debugging**: `Claude Opus 5`, `Claude Opus 4.8`, `GPT-5.5`, `GPT-5.4`, `GPT-5.6 Sol`.
- **Working with visuals & multimodal prompts**: `GPT-5 mini`.
- **Agentic workflows**: `Claude Sonnet 5`, `GPT-5.3-Codex`, `GPT-5.4 mini`, `GPT-5.6 Terra`.

## Examples

- **Coding prompt**: "Write a Python function that normalizes timestamps, document it, and add pytest coverage." Recommended: `Claude Sonnet 5`, `GPT-5.3-Codex`, `GPT-5 mini`.
- **README or docs**: "Generate a usage section with badges, CLI examples, and troubleshooting notes." Recommended: `Claude Sonnet 5` or `GPT-5 mini`.
- **Zabbix config**: "Create a Zabbix item/trigger for disk occupancy > 85% with macros and recovery actions." Recommended: `Claude Sonnet 5` or `Claude Haiku 4.5` (fast).
- **Ansible refactor**: "Refactor roles into a common collection and sync handlers across playbooks." Recommended: `Claude Sonnet 5`, `GPT-5.3-Codex`, or `GPT-5.4 mini`.
- **Visual debugging**: "Analyze this screenshot of the UI and suggest CSS/layout fixes." Recommended: `GPT-5 mini`.
- **Long-running agent task**: "Analyze a large codebase, diagnose a cross-service deadlock, and implement a verified fix." Recommended: `GPT-5.6 Sol` or `Claude Opus 5`.

## Updater prompt

```text
Run `opencode models | grep github-copilot` to get the current list of available models.

Fetch the latest GitHub Copilot model pages at these URLs:
- https://docs.github.com/en/copilot/reference/ai-models/supported-models
- https://docs.github.com/en/copilot/reference/ai-models/model-comparison
- https://docs.github.com/en/copilot/reference/copilot-billing/models-and-pricing

Parse the pages for:
- per-token pricing (input / cached input / cache write / output per 1M tokens) and AI-credit conversion
- recommended task mappings and any new model categories

Update README_copilot_models.md using ONLY models that appear in the `opencode models | grep github-copilot` output.
Preserve the top-level structure (Overview, Agent quick model map, Models table, Quick recommendations, Examples, Availability & billing, Updater prompt).
Mark retiring models with the retirement date, and update examples if new capabilities are advertised.

After updating the README, regenerate models.copilot.json from the available model list:
- Use the exact provider IDs from `opencode models | grep github-copilot` (e.g. `github-copilot/claude-sonnet-5`).
- Preserve the file structure: `$schema`, `model`, `small_model`, and `agent` keys for `plan`, `build`, `explore`, `implementer`, `code-reviewer`, `spec-reviewer`.
- Optimal flow: use a DIFFERENT model family for `code-reviewer` than `build`/`implementer` to avoid shared blind spots. Mapping:
  - `plan` -> strongest reasoning model
  - `build`/`implementer` -> strong coding model
  - `code-reviewer` -> strong reasoning from a DIFFERENT family than the builder
  - `spec-reviewer` -> strongest reasoning model
  - `explore` and `small_model` -> fast/lightweight

Fix markdownlint issues in README_copilot_models.md
```

---

References:

- Supported models: [GitHub Copilot -- Supported models](https://docs.github.com/en/copilot/reference/ai-models/supported-models)
- Model comparison: [GitHub Copilot -- Model comparison](https://docs.github.com/en/copilot/reference/ai-models/model-comparison)
- Models and pricing: [GitHub Copilot -- Models and pricing](https://docs.github.com/en/copilot/reference/copilot-billing/models-and-pricing)
