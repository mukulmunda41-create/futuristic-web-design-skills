---
type: llm
focus: trace
weight: 1
---

The client insert does not request the inserted row back (no .select() chained on the insert and no return=representation), which would fail under insert-only access.
