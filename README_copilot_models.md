# GitHub Copilot Models Overview

This document mirrors the GitHub Copilot AI model docs to keep the team aware of which models are supported, their strengths, and the right task for each.

Last synced: 2026-04-18

## Overview

- GitHub Copilot supports general-purpose, fast/lightweight, deep reasoning, agentic, and multimodal variants. Each category balances latency, reasoning, and multimodal context support.
- The roadmap keeps adding agentic Codex variants (`GPT-5.2-Codex`, `GPT-5.3-Codex`, `GPT-5.4-Codex`) and multimodal/visual champions (`GPT-5 mini`, `GPT-5.4`, `Claude Sonnet 4.6`).
- New additions include `GPT-5.4`, `GPT-5.4 mini`, `Claude Sonnet 4.6`, `Claude Opus 4.7`, `Gemini 3.1 Pro`, `Goldeneye`, and `Qwen2.5`.

## Models table

| Model | Provider | Category | Strengths | Status / Notes |
| --- | --- | --- | --- | --- |
| GPT-4.1 | OpenAI | General-purpose coding & writing | Fast, accurate code completions. | GA |
| GPT-5 mini | OpenAI | General-purpose multimodal | Fast, accurate completions with visuals. | GA |
| GPT-5.2 | OpenAI | Deep reasoning & debugging | Multi-step problem solving, architecture analysis. | GA |
| GPT-5.3-Codex | OpenAI | Agentic | Agentic software development. | GA |
| GPT-5.4 | OpenAI | Deep reasoning & debugging | Complex reasoning across architectures. | GA |
| GPT-5.4 mini | OpenAI | Agentic | Codebase exploration with grep-style tools. | GA |
| Grok Code Fast 1 | xAI | General-purpose coding | Fast, budget-friendly completions (0.25x multiplier). | GA |
| Raptor mini | Fine-tuned GPT-5 mini | Fast inline suggestions | Ultra-fast inline completions. | Public preview |
| Goldeneye | Fine-tuned GPT-5.1-Codex | Deep reasoning | Complex problem-solving. | Public preview |
| Claude Haiku 4.5 | Anthropic | Fast & lightweight | Quick answers (0.33x multiplier). | GA |
| Claude Opus 4.5 | Anthropic | Deep reasoning & debugging | Sophisticated reasoning. | GA |
| Claude Opus 4.6 | Anthropic | Deep reasoning & debugging | Anthropic's powerful reasoning model. | GA |
| Claude Opus 4.6 (fast mode) | Anthropic | Deep reasoning & debugging | Fast mode preview. | Public preview |
| Claude Opus 4.7 | Anthropic | Deep reasoning & debugging | Anthropic's most powerful model. | GA |
| Claude Sonnet 4 | Anthropic | Multimodal & deep reasoning | Balanced performance for coding. | GA |
| Claude Sonnet 4.5 | Anthropic | Multimodal & agentic | Structured outputs for reasoning tasks. | GA |
| Claude Sonnet 4.6 | Anthropic | Multimodal & agentic | Improved completions and reasoning. | GA |
| Gemini 2.5 Pro | Google | Deep reasoning & debugging | Complex generation and debugging. | GA |
| Gemini 3 Flash | Google | Fast & lightweight | Fast responses (0.33x multiplier). | Public preview |
| Gemini 3.1 Pro | Google | Deep reasoning & visual | Long-context reasoning with visual context. | Public preview |
| Qwen2.5 | Alibaba | General-purpose coding | Code generation, reasoning, and debugging. | GA |

## Quick recommendations by task

- **General-purpose coding & writing**: `GPT-4.1`, `GPT-5 mini`, `Grok Code Fast 1`, `Qwen2.5`, and `GPT-5.3-Codex` balance quality, speed, and multimodal context.
- **Fast / repetitive work**: `Claude Haiku 4.5`, `Gemini 3 Flash`, and `Raptor mini` keep latency low.
- **Deep reasoning & debugging**: `GPT-5.2`, `GPT-5.4`, `Claude Opus 4.5`, `Claude Opus 4.6`, `Claude Opus 4.7`, `Claude Sonnet 4.6`, `Gemini 2.5 Pro`, and `Goldeneye` tackle multi-file investigations.
- **Working with visuals & multimodal prompts**: `GPT-5 mini`, `Claude Sonnet 4.6`, and `Gemini 3.1 Pro` handle screenshots/diagrams.
- **Agentic workflows**: `GPT-5.2-Codex`, `GPT-5.3-Codex`, and `GPT-5.4 mini` automate PR creation and multi-file edits.

## Examples

- **Coding prompt**: "Write a Python function that normalizes timestamps, document it, and add pytest coverage." Recommended models: `GPT-5 mini`, `Grok Code Fast 1`, `Qwen2.5`.
- **README or docs**: "Generate a usage section with badges, CLI examples, and troubleshooting notes." Recommended: `GPT-4.1` or `GPT-5 mini`.
- **Zabbix config**: "Create a Zabbix item/trigger for disk occupancy > 85% with macros and recovery actions." Recommended: `Claude Haiku 4.5` or `Claude Opus 4.7`.
- **Ansible refactor**: "Refactor roles into a common collection and sync handlers across playbooks." Recommended: `GPT-5.3-Codex` or `GPT-5.4 mini`.
- **Visual debugging**: "Analyze this screenshot of the UI and suggest CSS/layout fixes." Recommended: `GPT-5 mini`, `Claude Sonnet 4.6`, or `Gemini 3.1 Pro`.
- **Deep reasoning**: "Debug an inter-service deadlock with logs across three services." Recommended: `GPT-5.4`, `Claude Opus 4.7`, or `Gemini 2.5 Pro`.

## Availability & billing

- All supported models are available in Copilot Free, Pro, Pro+, Business, and Enterprise plans.
- Copilot Chat auto-selects the best model by default; manually override if you want a specific model.
- Premium request multipliers impact paid-plan allowances:
  - **0x**: `GPT-4.1`, `Qwen2.5`, `Raptor mini`.
  - **0.25x**: `Grok Code Fast 1`.
  - **0.33x**: `Claude Haiku 4.5`, `Gemini 3 Flash`.
  - **1x**: `GPT-5 mini`, `GPT-5.2`, `GPT-5.3-Codex`, `GPT-5.4`, `GPT-5.4 mini`, `Claude Sonnet 4`, `Claude Sonnet 4.5`, `Claude Sonnet 4.6`, `Gemini 2.5 Pro`, `Gemini 3.1 Pro`.
  - **3x**: `Claude Opus 4.5`, `Claude Opus 4.6`.
  - **9x**: `Claude Opus 4.6 (fast mode)`.
  - **10x**: `Claude Opus 4.7`.
- Copilot Free users pay the same multipliers when models are available.

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