# Aman Bhandari

Software engineer. Three-plus years shipping across any stack, product, or phase of the SDLC. Primary workflow is Claude Code + MCP — the agents build the internal tooling my team consumes as daily work product.

The five pinned repos below are clean-room extracts from a private agentic ecosystem. Each one encodes a pattern worth reusing; each ships with an integrity-check script, a claim-evidence mapping, and a green CI pipeline.

## What I build with

- **Claude Code** — skill design, hook configuration, multi-skill orchestration, sub-agent fan-out, rule-obsolescence audit discipline
- **MCP** — at the primitive level (Jira / Slack / Chrome DevTools / Gmail), not wrapped abstractions
- **Python** — for agentic tooling, pipelines, and schema-first config systems
- **Next.js 16 + React 19 + TypeScript 5 strict + Tailwind v4 + MDX** — for the publishing layer of the ecosystem
- **SQLite + YAML schemas** — the trending-store and flag-gated-config combo that makes agentic pipelines debuggable

## Pinned repositories

### [`claude-code-mcp-qa-automation`](https://github.com/aman-bhandari/claude-code-mcp-qa-automation)
Reference scaffold for QA-automation pipelines built on Claude Code skills + MCP patterns. 16 skill contracts, an 8-module Python scaffold demonstrating sub-agent orchestration, a 7-table SQLite trending store, and a runnable end-to-end demo over synthetic fixtures (2 boards, 30 tickets). 7 pytest tests.

### [`claude-code-agent-skills-framework`](https://github.com/aman-bhandari/claude-code-agent-skills-framework)
Research scaffold for AI engineering with Claude Code. 15 rule files (13 persistent + 2 path-scoped); 4 pilot rules carry a `**WHY:**` + `**Retire when:**` audit-tag discipline so prompts decay cleanly as models improve. 21 skills. Concentric-loop pedagogy pinned per-node to named practitioners (Chip Huyen, Eugene Yan, Hamel Husain, Jeremy Howard, Sebastian Raschka, Andrej Karpathy, Julia Evans).

### [`llm-rag-knowledge-graph`](https://github.com/aman-bhandari/llm-rag-knowledge-graph)
Chronicle editorial format + wiki-as-RAG graph shape for LLM-powered research labs. 2 sample chronicles, 5 cross-linked concept pages, a zero-dependency Python retrieval example. Designed so a research lab's session history becomes a retrievable corpus without any vector-DB infrastructure.

### [`nextjs-16-mdx-research-publisher`](https://github.com/aman-bhandari/nextjs-16-mdx-research-publisher)
Static publisher for short research notes. Next.js 16 + React 19 + TypeScript 5 strict + Tailwind v4 + MDX + Schema.org JSON-LD. 5 static routes (3 MDX posts + home + 404). Fresh `npm run build` verified clean; JSON-LD confirmed in the rendered HTML output.

### [`claude-multi-agent-protocol`](https://github.com/aman-bhandari/claude-multi-agent-protocol)
HANDOVER + SYNC inter-repo protocol for multi-agent AI systems. Specification + synthetic examples (3-entry HANDOVER log + 4-decision SYNC log) + stdlib-only conformance validator. The validator caught a real spec/example inconsistency during build; fix is documented in the commit history as a conformance-loop demonstration.

## How the five repos fit together

The private ecosystem that produced these extracts has four roles. `claude-code-mcp-qa-automation` is the odd one out — extracted from a separate internal-tooling track (production QA agents at work), not from the coaching ecosystem.

```
                   ┌──────────────────────────────────┐
                   │       Private ecosystem          │
                   │  (four roles, four repos)        │
                   └──────────────────────────────────┘
                                   │
         ┌──────────┬──────────────┼──────────────┬──────────┐
         ▼          ▼              ▼              ▼          │
     Partner    Observer       Publisher       Commons       │
   (coaching  (chronicles    (static site    (inter-repo     │
    + rules    + wiki)        rendering)      protocol)      │
    + skills)     │              │               │           │
         │        │              │               │           │
         ▼        ▼              ▼               ▼           │
 claude-code-  llm-rag-    nextjs-16-mdx-  claude-multi-     │
 agent-skills- knowledge-  research-       agent-protocol    │
 framework    graph        publisher                         │
                                                             │
                                                             ▼
                                           ┌──────────────────────────────┐
                                           │  Separate internal-tooling   │
                                           │  track (work: QA automation) │
                                           └──────────────┬───────────────┘
                                                          │
                                                          ▼
                                            claude-code-mcp-qa-automation
                                            (sanitised clean-room extract)
```

Each public repo is the shape — not a full copy — of what runs privately. The pattern travels; the project-specific content stays private.

## How each repo is bulletproof

Every repo enforces the same pre-push contract:

- **Gate 0** — claim-evidence mapping. Every number / named capability in the README maps to a file or command that evidences it. Unverified rows fail CI.
- **Gate 1** — no-hype-language audit on public docs. A fixed deny-list of adjective-driven standards (documented per-artifact in the integrity scripts); every hit must be operationalised into a measurable replacement or deleted.
- **Gate 2** — clone-and-run. Fresh clone, follow the README, advertised output lands.
- **Gate 3** — documentation completeness. Standard README shape, every link resolves.
- **Gate 4** — identifier grep returns zero hits against a private-name exclusion list.
- **Gate 5** — secret grep returns zero hits.
- **Gate 6** — CI on every push runs the integrity check + hype-word audit.
- **Gate 7** — fresh-eye read. Diary-shaped, aspirational, or keyword-stuffed sentences get rewritten before ship.

The `scripts/integrity-check.sh` in each repo runs Gates 0, 1, 4, 5 + artifact-specific verification locally before any push. CI runs the same script on every commit.

## Contact

`bhandari.aman0101@gmail.com`
