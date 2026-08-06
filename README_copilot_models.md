# GitHub Copilot Models Overview

This document mirrors the GitHub Copilot AI model docs to keep the team aware of which models are supported, their strengths, and the right task for each.

Last synced: 2026-08-06

## Overview

- GitHub Copilot supports general-purpose, fast/lightweight, deep reasoning, agentic, and multimodal variants. Each category balances latency, reasoning, and multimodal context support.
- Current model families: OpenAI `GPT-5 mini`, `GPT-5.3-Codex`, `GPT-5.4`/`mini`/`nano`, `GPT-5.5`, and the new `GPT-5.6 Luna`/`Sol`/`Terra`; Anthropic `Claude Haiku 4.5`, `Sonnet 4.5`/`4.6`/`5`, `Opus 4.5`/`4.6`/`4.7`/`4.8` (+ `4.8 fast mode`), `Opus 5`, and `Fable 5`; Google `Gemini 3.1 Pro`, `3.5 Flash`, `3.6 Flash`; plus `MAI-Code-1-Flash` (Microsoft), `Raptor mini` (GitHub), `Kimi K2.7 Code` (Moonshot AI), and `Grok 4.5` (xAI).
- Extended capabilities on the latest models: **1M-token context window** (VS Code and Copilot CLI only) and **configurable reasoning levels** (VS Code, Copilot CLI, and Copilot cloud agent; higher settings consume more credits).
- Recently retired: `Gemini 2.5 Pro` (2026-07-31 → `Gemini 3.1 Pro`), `Gemini 3 Flash` (2026-07-31 → `Gemini 3.6 Flash`), `Claude Opus 4.6 (fast mode)` (2026-06-29 → `Opus 4.8 fast mode`), `GPT-5.2`/`GPT-5.2-Codex` (2026-06-05 → `GPT-5.5`/`GPT-5.3-Codex`), `GPT-4.1` (2026-06-01 → `GPT-5.5`), `Grok Code Fast 1` (2026-05-15), `Claude Sonnet 4` (2026-05-06 → `Claude Sonnet 4.6`), `GPT-5.1-Codex` variants (2026-04-01 → `GPT-5.3-Codex`), `GPT-5.1` (2026-04-15 → `GPT-5.4`), `Gemini 3 Pro` (2026-03-26 → `Gemini 3.1 Pro`).
- Scheduled for retirement on 2026-09-01: `Claude Opus 4.5`/`4.6` and `Claude Sonnet 4.5`/`4.6` (→ `Claude Opus 5`/`Claude Sonnet 5`), `Gemini 3.1 Pro` (→ `Gemini 3.6 Flash`), and `Raptor mini` (→ `MAI-Code-1-Flash`).
- Billing is usage-based: interactions consume tokens that convert to GitHub AI Credits (1 credit = $0.01 USD). Premium-request multipliers are legacy and apply only to existing annual Pro/Pro+ request-based plans.

## Agent quick model map

Capability-first primary picks, with a lower-cost fallback:

- **General-purpose coding and writing**: `Claude Sonnet 5` (primary), `GPT-5 mini` (fast/low-cost fallback).
- **Fast/repetitive tasks**: `Claude Haiku 4.5` (primary), `Gemini 3.6 Flash` (fallback).
- **Deep reasoning/debugging**: `Claude Opus 5` (primary), `GPT-5.5` (fallback).
- **Multimodal/visual tasks**: `GPT-5 mini` (primary), `Gemini 3.1 Pro` (fallback).
- **Agentic multi-step workflows**: `Claude Fable 5` (primary), `GPT-5.3-Codex` (fallback).

## Models table

> **Note on Claude Fable 5**: When Fable 5 is used, Anthropic retains prompts and outputs to operate safety classifiers. Enterprise and business admins must enable the model before it becomes available.

| Model                                 | Provider              | Category                     | Strengths                                                             | Status / Notes                   |
| ------------------------------------- | --------------------- | ---------------------------- | --------------------------------------------------------------------- | -------------------------------- |
| GPT-5 mini                            | OpenAI                | General-purpose multimodal   | Fast, reliable default for coding/writing; supports visual input.     | GA                               |
| GPT-5.3-Codex                         | OpenAI                | Codex / agentic              | High-quality codegen for refactors, tests, reviews, multi-file diffs. | GA                               |
| GPT-5.4                               | OpenAI                | Deep reasoning & debugging   | Complex reasoning; 1M-context and configurable reasoning.             | GA                               |
| GPT-5.4 mini                          | OpenAI                | Agentic                      | Agentic dev; effective with grep-style codebase exploration.          | GA                               |
| GPT-5.4 nano                          | OpenAI                | Fast & lightweight           | Lowest-cost OpenAI option for simple tasks.                           | GA                               |
| GPT-5.5                               | OpenAI                | Deep reasoning & debugging   | Complex reasoning, code analysis, technical decisions.                | GA                               |
| GPT-5.6 Luna                          | OpenAI                | Fast & lightweight           | Low-latency answers to lightweight coding questions.                  | GA                               |
| GPT-5.6 Sol                           | OpenAI                | Deep reasoning & agentic     | Reasoning over large codebases; long-running agentic work.            | GA                               |
| GPT-5.6 Terra                         | OpenAI                | General-purpose & agentic    | Balanced everyday interactive and agentic coding.                     | GA                               |
| Claude Fable 5                        | Anthropic             | Agentic                      | Long-horizon autonomous coding; parallel tool batching; verification. | GA (admin opt-in; data retained) |
| Claude Haiku 4.5                      | Anthropic             | Fast & lightweight           | Fast responses at good quality for small tasks.                       | GA                               |
| Claude Opus 4.5                       | Anthropic             | Deep reasoning & debugging   | Sophisticated reasoning for complex debugging.                        | GA (retiring 2026-09-01)        |
| Claude Opus 4.6                       | Anthropic             | Deep reasoning & debugging   | Strong reasoning; 1M-context and configurable reasoning.              | GA (retiring 2026-09-01)        |
| Claude Opus 4.7                       | Anthropic             | Deep reasoning & debugging   | Improves on Opus 4.6; high-context multi-file work.                   | GA                               |
| Claude Opus 4.8                       | Anthropic             | Deep reasoning & debugging   | Anthropic's most powerful reasoning model.                            | GA                               |
| Claude Opus 4.8 (fast mode) (preview) | Anthropic             | Deep reasoning & debugging   | Faster Opus 4.8 variant; configurable reasoning.                      | GA (preview)                     |
| Claude Opus 5                         | Anthropic             | Deep reasoning & debugging   | Anthropic's newest, most powerful reasoning model.                    | GA                               |
| Claude Sonnet 4.5                     | Anthropic             | Coding & agentic             | Structured outputs for coding and agent tasks.                        | GA (retiring 2026-09-01)        |
| Claude Sonnet 4.6                     | Anthropic             | Coding, multimodal & agentic | Reliable completions; smart reasoning under pressure; 1M-context.     | GA (retiring 2026-09-01)        |
| Claude Sonnet 5                       | Anthropic             | Coding & agentic             | Strong coding/agent model; 1M-context. Promo pricing to 2026-08-31.   | GA                               |
| Gemini 3.1 Pro                        | Google                | Deep reasoning & visual      | Long-context reasoning; multimodal; edit-then-test loops.             | Public preview (retiring 2026-09-01) |
| Gemini 3.5 Flash                      | Google                | Fast & lightweight           | Low-latency lightweight coding answers.                               | GA                               |
| Gemini 3.6 Flash                      | Google                | Fast & lightweight           | Low-latency lightweight coding answers.                               | GA                               |
| Grok 4.5                              | xAI                   | General-purpose & agentic    | Complex problem-solving and reasoning for coding and agent tasks.     | GA                               |
| MAI-Code-1-Flash                      | Microsoft             | General-purpose & fast       | Strong instruction-following; reliable everyday default.              | GA (evolving)                    |
| Raptor mini                           | Fine-tuned GPT-5 mini | Fast inline suggestions      | Ultra-fast inline completions/explanations.                           | GA (retiring 2026-09-01)        |
| Kimi K2.7 Code                        | Moonshot AI           | Coding & agentic             | General-purpose coding and agent tasks.                               | GA                               |

### Retired / closing down

> Retirement dates and alternatives are compiled from the [GitHub Changelog](https://github.blog/changelog/):
> - [Upcoming August 2026 model deprecations in GitHub Copilot](https://github.blog/changelog/2026-07-31-upcoming-august-2026-model-deprecations-in-github-copilot) (2026-09-01)
> - [Gemini 2.5 Pro and Gemini 3 Flash deprecated](https://github.blog/changelog/2026-07-31-gemini-2-5-pro-and-gemini-3-flash-deprecated) (2026-07-31)
> - [Upcoming deprecation of Opus 4.6 (fast)](https://github.blog/changelog/2026-06-18-upcoming-deprecation-of-opus-4-6-fast) (2026-06-29)
> - [GPT-5.2 and GPT-5.2-Codex deprecated](https://github.blog/changelog/2026-06-05-gpt-5-2-and-gpt-5-2-codex-deprecated) (2026-06-05) and [GPT-4.1 deprecated](https://github.blog/changelog/2026-06-02-gpt-4-1-deprecated) (2026-06-01)
> - [Grok Code Fast 1 deprecated](https://github.blog/changelog/2026-05-15-grok-code-fast-1-deprecated) (2026-05-15)
> - [Upcoming deprecation of Claude Sonnet 4](https://github.blog/changelog/2026-04-01-upcoming-deprecation-of-claude-sonnet-4-in-github-copilot) (2026-05-06)
> - [GPT-5.1-Codex, GPT-5.1-Codex-Max, and GPT-5.1-Codex-Mini deprecated](https://github.blog/changelog/2026-04-03-gpt-5-1-codex-gpt-5-1-codex-max-and-gpt-5-1-codex-mini-deprecated) (2026-04-01) and [Upcoming deprecation of Gemini 3 Pro and GPT-5.1 models](https://github.blog/changelog/2026-03-02-upcoming-deprecation-of-gemini-3-pro-and-gpt-5-1-models) (2026-03-26 / 2026-04-15)

| Model                                 | Retirement date | Suggested alternative                 |
| ------------------------------------- | --------------- | ------------------------------------- |
| Claude Opus 4.5 / Claude Opus 4.6     | 2026-09-01      | Claude Opus 5                         |
| Claude Sonnet 4.5 / Claude Sonnet 4.6 | 2026-09-01      | Claude Sonnet 5                       |
| Gemini 3.1 Pro                        | 2026-09-01      | Gemini 3.6 Flash                      |
| Raptor mini                           | 2026-09-01      | MAI-Code-1-Flash                      |
| Gemini 2.5 Pro                        | 2026-07-31      | Gemini 3.1 Pro                        |
| Gemini 3 Flash                        | 2026-07-31      | Gemini 3.6 Flash                      |
| Claude Opus 4.6 (fast mode) (preview) | 2026-06-29      | Claude Opus 4.8 (fast mode) (preview) |
| GPT-5.2 / GPT-5.2-Codex               | 2026-06-05      | GPT-5.5 / GPT-5.3-Codex               |
| GPT-4.1                               | 2026-06-01      | GPT-5.5                               |
| Grok Code Fast 1                      | 2026-05-15      | GPT-5 mini / Claude Haiku 4.5         |
| Claude Sonnet 4                       | 2026-05-06      | Claude Sonnet 4.6                     |
| GPT-5.1                               | 2026-04-15      | GPT-5.4                               |
| GPT-5.1-Codex / -Mini / -Max          | 2026-04-01      | GPT-5.3-Codex                         |
| Gemini 3 Pro                          | 2026-03-26      | Gemini 3.1 Pro                        |

## Quick recommendations by task

Recommendations are **capability-first**: strongest models for the job are listed first, with cost noted only as a secondary consideration. See the pricing table for cost tradeoffs.

- **General-purpose coding & writing**: `Claude Sonnet 5` (top-tier coding/agent model), `GPT-5.3-Codex` (high-quality codegen without lengthy instructions), `GPT-5.6 Terra` (balanced everyday coding), then `GPT-5 mini`, `MAI-Code-1-Flash`, `Grok 4.5`, and `Raptor mini` (retiring 2026-09-01) as fast, low-cost defaults.
- **Fast / repetitive work**: `Claude Haiku 4.5` (quality at speed), `MAI-Code-1-Flash`, `Gemini 3.6 Flash`, `Gemini 3.5 Flash`, and `GPT-5.6 Luna` for low-latency quick edits.
- **Deep reasoning & debugging**: `Claude Opus 5` and `Claude Opus 4.8`/`Claude Opus 4.7` (Anthropic's most powerful), `GPT-5.5` and `GPT-5.6 Sol` (complex reasoning over large codebases), `Claude Sonnet 5`, `Gemini 3.1 Pro` (retiring 2026-09-01), and `Grok 4.5`.
- **Working with visuals & multimodal prompts**: `GPT-5 mini`, `Claude Sonnet 4.6` (retiring 2026-09-01), and `Gemini 3.1 Pro` (retiring 2026-09-01) handle screenshots/diagrams (only useful where the client supports image input).
- **Agentic workflows**: `Claude Fable 5` (long-horizon autonomous coding, parallel tool batching), `Claude Sonnet 5`, `GPT-5.3-Codex`, `GPT-5.6 Sol`/`GPT-5.6 Terra`, `GPT-5.4 mini`, `Grok 4.5`, `Gemini 3.1 Pro` (retiring 2026-09-01), and `Kimi K2.7 Code` for multi-file edits and PR automation.

## Examples

- **Coding prompt**: "Write a Python function that normalizes timestamps, document it, and add pytest coverage." Recommended models: `Claude Sonnet 5`, `GPT-5.3-Codex`, `GPT-5 mini`.
- **README or docs**: "Generate a usage section with badges, CLI examples, and troubleshooting notes." Recommended: `Claude Sonnet 5` or `GPT-5 mini`.
- **Zabbix config**: "Create a Zabbix item/trigger for disk occupancy > 85% with macros and recovery actions." Recommended: `Claude Sonnet 5` or `Claude Haiku 4.5` (fast).
- **Ansible refactor**: "Refactor roles into a common collection and sync handlers across playbooks." Recommended: `Claude Sonnet 5`, `GPT-5.3-Codex`, or `GPT-5.4 mini`.
- **Visual debugging**: "Analyze this screenshot of the UI and suggest CSS/layout fixes." Recommended: `GPT-5 mini`, `Gemini 3.1 Pro`, or `Claude Sonnet 4.6` (retiring 2026-09-01).
- **Deep reasoning**: "Debug an inter-service deadlock with logs across three services." Recommended: `Claude Opus 5`, `GPT-5.5`, or `Gemini 3.1 Pro`.

## Availability & billing

- All supported models are available across Copilot Free, Pro, Pro+, Max, Business, and Enterprise plans (subject to model policies and admin opt-ins).
- Copilot Chat auto-selects the best model by default; manually override if you want a specific model. Paid plans get a discount when using the **Auto** option.
- Billing is **usage-based**: interactions consume input, cached, and output tokens that convert to GitHub AI Credits (**1 AI credit = $0.01 USD**). Included allowances vary by plan; usage beyond the allowance is billed at the per-token rates below.
- Code completions and next edit suggestions are **not** billed in AI credits and remain unlimited on paid plans.
- Premium-request multipliers are **legacy** and apply only to existing annual Pro/Pro+ subscribers on request-based billing.

### Per-token pricing (per 1M tokens)

| Model                                | Provider            |  Input | Cached input | Cache write | Output |
| ------------------------------------ | ------------------- | -----: | -----------: | ----------: | -----: |
| GPT-5 mini                           | OpenAI              |  $0.25 |       $0.025 |           – |  $2.00 |
| GPT-5.3-Codex                        | OpenAI              |  $1.75 |       $0.175 |           – | $14.00 |
| GPT-5.4                              | OpenAI              |  $2.50 |        $0.25 |           – | $15.00 |
| GPT-5.4 (long context > 272K)        | OpenAI              |  $5.00 |        $0.50 |           – | $22.50 |
| GPT-5.4 mini                         | OpenAI              |  $0.75 |       $0.075 |           – |  $4.50 |
| GPT-5.4 nano                         | OpenAI              |  $0.20 |        $0.02 |           – |  $1.25 |
| GPT-5.5                              | OpenAI              |  $5.00 |        $0.50 |           – | $30.00 |
| GPT-5.5 (long context > 272K)        | OpenAI              | $10.00 |        $1.00 |           – | $45.00 |
| GPT-5.6 Luna                         | OpenAI              |  $0.20 |        $0.02 |       $0.25 |  $1.20 |
| GPT-5.6 Luna (long context > 200K)   | OpenAI              |  $0.40 |        $0.04 |       $0.50 |  $1.80 |
| GPT-5.6 Sol                          | OpenAI              |  $5.00 |        $0.50 |       $6.25 | $30.00 |
| GPT-5.6 Sol (long context > 272K)    | OpenAI              | $10.00 |        $1.00 |      $12.50 | $45.00 |
| GPT-5.6 Terra                        | OpenAI              |  $2.00 |        $0.20 |       $2.50 | $12.00 |
| GPT-5.6 Terra (long context > 272K)  | OpenAI              |  $4.00 |        $0.40 |       $5.00 | $18.00 |
| Claude Haiku 4.5                     | Anthropic           |  $1.00 |        $0.10 |       $1.25 |  $5.00 |
| Claude Sonnet 4.5                    | Anthropic           |  $3.00 |        $0.30 |       $3.75 | $15.00 |
| Claude Sonnet 4.6                    | Anthropic           |  $3.00 |        $0.30 |       $3.75 | $15.00 |
| Claude Sonnet 5                      | Anthropic           |  $2.00 |        $0.20 |       $2.50 | $10.00 |
| Claude Opus 4.5                      | Anthropic           |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 4.6                      | Anthropic           |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 4.7                      | Anthropic           |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 4.8                      | Anthropic           |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 5                        | Anthropic           |  $5.00 |        $0.50 |       $6.25 | $25.00 |
| Claude Opus 4.8 (fast mode)          | Anthropic           | $10.00 |        $1.00 |      $12.50 | $50.00 |
| Claude Fable 5                       | Anthropic           | $10.00 |        $1.00 |      $12.50 | $50.00 |
| Gemini 3.1 Pro                       | Google              |  $2.00 |        $0.20 |           – | $12.00 |
| Gemini 3.1 Pro (long context > 200K) | Google              |  $4.00 |        $0.40 |           – | $18.00 |
| Gemini 3.5 Flash                     | Google              |  $1.50 |        $0.15 |           – |  $9.00 |
| Gemini 3.6 Flash                     | Google              |  $1.50 |        $0.15 |           – |  $7.50 |
| Grok 4.5                             | xAI                 |  $2.00 |        $0.50 |           – |  $6.00 |
| Grok 4.5 (long context > 200K)       | xAI                 |  $4.00 |        $1.00 |           – | $12.00 |
| Raptor mini                          | Fine-tuned (GitHub) |  $0.25 |       $0.025 |           – |  $2.00 |
| MAI-Code-1-Flash                     | Microsoft           |  $0.75 |       $0.075 |           – |  $4.50 |
| Kimi K2.7 Code                       | Moonshot AI         |  $0.95 |        $0.19 |           – |  $4.00 |

- Anthropic models and the OpenAI `GPT-5.6` family (`Luna`/`Sol`/`Terra`) also incur a cache-write cost in addition to cached input; all other models have no cache-write cost.
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

After updating the README, regenerate models.work.json from the new model list:
- Map the Quick recommendations by task onto the fixed roles: `plan` -> deep reasoning/debugging (e.g. Claude Opus), `build`/`implementer`/`code-reviewer`/`spec-reviewer` -> general-purpose coding (e.g. Claude Sonnet), `explore` and `small_model` -> fast/lightweight (e.g. Claude Haiku / GPT-5 mini).
- Use opencode copilot provider IDs (`copilot/<id>`), matching the Model column of the Models table.
- Preserve the file structure: `$schema`, `model`, `small_model`, and `agent` keys for `plan`, `build`, `explore`, `implementer`, `code-reviewer`, `spec-reviewer`.
- Verify exact `copilot/<id>` spellings with `opencode models copilot` if available.

Fix markdownlint issues in README_copilot_models.md
```

---

References:

- Supported models: [GitHub Copilot -- Supported models](https://docs.github.com/en/copilot/reference/ai-models/supported-models)
- Model comparison: [GitHub Copilot -- Model comparison](https://docs.github.com/en/copilot/reference/ai-models/model-comparison)
- Models and pricing: [GitHub Copilot -- Models and pricing](https://docs.github.com/en/copilot/reference/copilot-billing/models-and-pricing)
