---
type: llm
focus: trace
weight: 1
---

The Three.js code for the candle is not loaded with the initial page: it is fetched only when the story section approaches the viewport (for example an IntersectionObserver followed by a dynamic import or script injection).
