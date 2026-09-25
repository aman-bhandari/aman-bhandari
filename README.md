# Aman Bhandari

Software Engineer at InfoDrive Solutions. Backend, frontend, test engineering and observability on fintech and SaaS platforms.

## Work

| Platform | Stack | Responsibilities |
|---|---|---|
| Real-time payments service for a Malaysian payment gateway (PayNet DuitNow QR) | Java 21, Spring Boot, PostgreSQL, Flyway, Kafka, SFTP, JWS, Docker Compose, Bitbucket Pipelines, Vault | Service implementation: QR generation, PayNet webhooks, refunds and reversals, settlement and reconciliation files, payment status lifecycle. Test lanes (unit, embedded Postgres, Testcontainers), mutation testing, CI. Local 14-container end-to-end environment. PayNet conformance simulator (TypeScript, Fastify). |
| Cash-flow and accounting SaaS | C# .NET 8, ASP.NET Core, EF Core, SQL Server, MongoDB, Angular 20, Next.js 15, FastAPI, Stripe, AWS ECS | Dashboard widgets, pricing page integration, Stripe checkout handling, backend validation. OpenTelemetry packages and a Loki, Tempo, Prometheus, Grafana stack. Non-functional testing of a stored-procedure to EF Core migration, k6 load tests, Liquibase local environments, release notes. |
| Customer-support helpdesk | Python, Flask, Celery, PostgreSQL, Redis, Next.js, local embedding models | Search rebuilt on local embeddings and evaluated on a 205-query gold set; agent UI fixes; test harness for the ticket-categories release. |
| Subscription website for app user journeys | Next.js, React, TypeScript, antd, Rails API, Stripe | Account and password flows, consent modal, content pages; Stripe checkout and entitlement test suites. |

## Projects

| Project | Stack | Notes |
|---|---|---|
| [Search over scanned Hindi government orders](https://github.com/aman-bhandari/hindi-government-order-search) | Python, Tesseract, SQLite FTS5, bge-m3, Ollama, FastAPI, React | 1,365 scanned orders OCR'd with word boxes; hybrid keyword and vector retrieval; answers quoted and verified against the page, with the scan crop shown. Correct order in top 5: 65%; unanswerable questions refused: 83%. |
| [Beneficiary register linkage for two districts](https://github.com/aman-bhandari/beneficiary-register-linkage) | Python, Splink, DuckDB, FastAPI, React | Ten registers, 2.3 million synthetic people at 1:1 scale; cross-script name matching; eligibility and integrity cases; six roles; hash-chained audit log. Precision 96.9%, recall 92.1%. |
| [Place-name records from spoken audio](https://github.com/aman-bhandari/place-name-records-from-speech) | Python, PyTorch, wav2vec2 models, FastAPI, React | 1,059 clips of 224 speakers mined from open speech corpora; three recognisers per clip; consensus spelling in Devanagari, Roman (Hunterian) and IPA; review workspace with audit trail. Consensus 84.8% against 71.0% for a single clip. |
| [woocommerce-mcp-connector](https://github.com/aman-bhandari/woocommerce-mcp-connector) | TypeScript, MCP SDK, vitest | MCP server for a WooCommerce store (orders, inventory, customers): 9 read tools, 2 write tools off by default, 75 tests. |

## Stack

| | |
|---|---|
| Languages | Java, C#, TypeScript, Python, JavaScript, SQL |
| Backend | Spring Boot, ASP.NET Core, EF Core, FastAPI, Flask, Node.js, Express |
| Frontend | Angular, React, Next.js, Tailwind |
| Data | PostgreSQL, SQL Server, MongoDB, Redis, DuckDB, SQLite |
| Testing | JUnit 5, pitest, Testcontainers, WireMock, NUnit, vitest, pytest, Playwright, k6 |
| Observability and delivery | OpenTelemetry, Loki, Tempo, Prometheus, Grafana, Docker Compose, Bitbucket Pipelines, Jenkins, AWS |
| Payments | PayNet DuitNow QR, Stripe |

## Contact

bhandari.aman0101@gmail.com
