---
description: Select the best Copilot model using current session context
agent: plan
---

Select the best GitHub Copilot model for the current session context and user request.

Instructions:
- Use `/home/cave/.config/opencode/README_copilot_models.md` as the source of truth.
- Infer the task type from this session's context (current request, files touched, and objective).
- Map the request to one of these categories: general-purpose coding/writing, fast/repetitive work, deep reasoning/debugging, multimodal/visual, or agentic multi-step workflows.
- If the request is ambiguous, provide both a primary and fallback model.
- Keep the answer short and actionable.

Output format:

```text
Model selection:
- Primary: <model> - <one-line reason tied to the current session request>
- Fallback: <model> - <one-line reason>
```

If the user passed extra details (`$ARGUMENTS`), use them to refine the selection.
