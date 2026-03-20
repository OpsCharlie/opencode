# GitHub Copilot Models Overview

This document mirrors the GitHub Copilot AI model docs to keep the team aware of which models are supported, their strengths, and the right task for each.

Last synced: 2026-02-12

## Overview

- GitHub Copilot supports general-purpose, fast/lightweight, deep reasoning, agentic, and multimodal variants. Each category balances latency, reasoning, and multimodal context support.
- The roadmap keeps adding agentic Codex variants (`GPT-5.1-Codex-Max`, `GPT-5.2-Codex`, `GPT-5.3-Codex`) and multimodal/visual champions (`GPT-5 mini`, `Claude Sonnet 4`, `Gemini 3 Pro`).
- Retirement notices (e.g., `GPT-5`, `GPT-5-Codex`, `Claude Opus 4.1`) are scheduled for 2026-02-17, so prefer their suggested alternatives once the date hits.

## Models table

| Model | Provider | Category | Strengths | Status / Notes |
| --- | --- | --- | --- | --- |
| GPT-4.1 | OpenAI | General-purpose coding & writing | Balanced prose/code output with low latency. | GA |
| GPT-5 mini | OpenAI | General-purpose multimodal | Fast, accurate completions that also handle visuals. | GA |
| GPT-5.1 | OpenAI | Deep reasoning & debugging | Multi-step problem solving, large-context analysis. | GA |
| GPT-5.2 | OpenAI | Deep reasoning & debugging | Complex reasoning across architectures; newer than GPT-5.1. | GA |
| Grok Code Fast 1 | xAI | General-purpose coding | Fast, budget-friendly completions; complimentary access extended. | GA (0.25x multiplier) |
| Raptor mini | Fine-tuned GPT-5 mini | Fast inline suggestions | Ultra-fast inline completions/explanations. | Public preview |
| GPT-5.1-Codex | OpenAI | Codex / agentic | High-quality codegen for refactors, tests, multi-file diffs. | GA |
| GPT-5.1-Codex-Mini | OpenAI | Codex / multimodal | Fast code reasoning with preview access. | Public preview |
| GPT-5.1-Codex-Max | OpenAI | Agentic | Automates PRs, agentic workflows. | GA |
| GPT-5.2-Codex | OpenAI | Agentic | Agentic software development; builds on GPT-5.2. | GA |
| GPT-5.3-Codex | OpenAI | Agentic | Latest agentic features for complex automation. | GA |
| Claude Haiku 4.5 | Anthropic | Fast & lightweight | Quick answers for small edits; low premium multiplier (0.33x). | GA |
| Claude Opus 4.5 | Anthropic | Deep reasoning & debugging | Sophisticated reasoning for complex debugging. | GA |
| Claude Opus 4.6 | Anthropic | Deep reasoning & debugging | Anthropic’s most capable reasoning model. | GA |
| Claude Opus 4.6 (fast mode) (preview) | Anthropic | Deep reasoning & debugging | Preview fast mode (9x multiplier Feb 7-16, 2026). | Public preview |
| Claude Sonnet 4 | Anthropic | Multimodal & deep reasoning | Balanced reasoning plus visual context. | GA |
| Claude Sonnet 4.5 | Anthropic | Multimodal & agentic | Structured outputs for reasoning/agent tasks. | GA |
| Gemini 2.5 Pro | Google | Deep reasoning & debugging | Handles complex generation, debugging, and research. | GA |
| Gemini 3 Flash | Google | Fast & lightweight | Fast responses for quick fixes (0.33x multiplier). | Public preview |
| Gemini 3 Pro | Google | Deep reasoning & visual | Long-context reasoning; supports multimodal queries. | Public preview |
| GPT-5 | OpenAI | Deep reasoning & debugging | High reasoning baseline; retiring 2026-02-17. | Closing down: 2026-02-17 (use GPT-5.2) |
| GPT-5-Codex | OpenAI | Codex / agentic | Prior Codex option; retiring 2026-02-17. | Closing down: 2026-02-17 (use GPT-5.1-Codex) |
| Claude Opus 4.1 | Anthropic | Deep reasoning & debugging | Older Anthropic flagship; retiring 2026-02-17. | Closing down: 2026-02-17 (use Claude Opus 4.5) |

## Quick recommendations by task

- **General-purpose coding & writing**: `GPT-4.1`, `GPT-5 mini`, `Grok Code Fast 1`, `GPT-5.1-Codex`, and `Qwen2.5` (per the comparison guide) balance quality, speed, and multimodal context.
- **Fast / repetitive work**: `Claude Haiku 4.5`, `Gemini 3 Flash`, and `Raptor mini` keep latency low and excel at small fixtures or syntax checks.
- **Deep reasoning & debugging**: `GPT-5.1`, `GPT-5.2`, `Claude Opus 4.5`, `Claude Opus 4.6`, `Claude Sonnet 4`, and `Gemini 2.5 Pro` tackle multi-file investigations, log analysis, and architecture reviews.
- **Working with visuals & multimodal prompts**: `GPT-5 mini`, `Claude Sonnet 4`, and `Gemini 3 Pro` all handle screenshots/diagrams inside Copilot Chat clients.
- **Agentic workflows**: `GPT-5.1-Codex-Max`, `GPT-5.2-Codex`, and `GPT-5.3-Codex` automate PR creation, multi-file edits, and scripted sequences of actions.

## Examples

- **Coding prompt**: “Write a Python function that normalizes timestamps, document it, and add pytest coverage.” Recommended models: `GPT-5 mini`, `Grok Code Fast 1`, `GPT-5.1-Codex`.
- **README or docs**: “Generate a usage section with badges, CLI examples, and troubleshooting notes.” Recommended: `GPT-4.1` or `GPT-5 mini` for prose + code balance.
- **Zabbix config**: “Create a Zabbix item/trigger for disk occupancy > 85% with macros and recovery actions.” Recommended: `Claude Haiku 4.5` for fast configs and `Claude Opus 4.6` for in-depth tuning.
- **Ansible refactor**: “Refactor roles into a common collection and sync handlers across playbooks.” Recommended: `GPT-5.1-Codex-Max`, `GPT-5.2-Codex`, or `GPT-5.3-Codex` for agentic workflows.
- **Visual debugging**: “Analyze this screenshot of the UI and suggest CSS/layout fixes.” Recommended: `GPT-5 mini`, `Claude Sonnet 4`, or `Gemini 3 Pro` for multimodal analysis.
- **Deep reasoning**: “Debug an inter-service deadlock with logs across three services.” Recommended: `GPT-5.2`, `Claude Opus 4.6`, or `Gemini 2.5 Pro`.

## Availability & billing

- All supported models are available in Copilot Free, Pro, Pro+, Business, and Enterprise plans (see the docs for the latest client-specific availability, including GitHub.com, Visual Studio Code, Visual Studio, JetBrains, Eclipse, and Xcode).
- Copilot Chat auto-selects the best model by default; manually override if you want a specific model or configuration.
- Premium request multipliers impact paid-plan allowances:
  - **0x**: `GPT-4.1`, `GPT-4o`, `Raptor mini`.
  - **0.25x**: `Grok Code Fast 1` (complimentary access extended).
  - **0.33x**: `Claude Haiku 4.5`, `Gemini 3 Flash`, `GPT-5.1-Codex-Mini`.
  - **1x**: `GPT-5`, `GPT-5 mini`, `GPT-5.1`, `GPT-5.1-Codex`, `GPT-5.1-Codex-Max`, `GPT-5.2`, `GPT-5.2-Codex`, `GPT-5.3-Codex`, `Claude Sonnet 4`, `Claude Sonnet 4.5`, `Gemini 2.5 Pro`, `Gemini 3 Pro`.
  - **3x**: `Claude Opus 4.5`, `Claude Opus 4.6`.
  - **9x (Feb 7-16, 2026 promo)**: `Claude Opus 4.6 (fast mode)`.
  - **10x**: `Claude Opus 4.1` (retiring 2026-02-17).
- Copilot Free users pay the same multipliers when models are available (the docs list the Free multiplier where applicable; some models are not available on Free).

## Updater prompt

```text
Fetch the latest GitHub Copilot model pages at these URLs:
- https://docs.github.com/en/copilot/reference/ai-models/supported-models
- https://docs.github.com/en/copilot/reference/ai-models/model-comparison

Parse the pages for:
- current list of supported models and release/preview/retirement status
- model multipliers and plan availability
- recommended task mappings and any new model categories (agentic, multimodal, flash/mini variants)

Update README_copilot_models.md preserving the top-level structure (Overview, Models table, Quick recommendations by task, Examples, Availability & billing, Updater prompt).
Add or remove models as the docs indicate, mark retiring models with the retirement date, and update examples if new capabilities (e.g., multimodal image input) are advertised.
Fix markdownlint issues in README_copilot_models.md
```

---

References:

- Supported models: [GitHub Copilot — Supported models](/en/copilot/reference/ai-models/supported-models)
- Model comparison: [GitHub Copilot — Model comparison](/en/copilot/reference/ai-models/model-comparison)
