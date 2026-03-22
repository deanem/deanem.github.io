---
title: Digest Case Study
description: Building a production news synthesis pipeline that turns raw RSS feeds into personalised, LLM-written email briefings.
layout: page
---
## Problem

Keeping up with a broad set of news sources means either spending an hour skimming or missing things entirely. Existing aggregators surface links — they don't synthesise. The goal was a system that reads across sources, groups related coverage, writes a coherent briefing, and delivers it on a schedule.

## Approach

Built a multi-stage pipeline:

1. **Ingestion** — RSS feeds polled on a schedule, articles deduplicated by URL, full text extracted via newspaper3k and BeautifulSoup.
2. **Clustering** — entity-boosted TF-IDF clustering (spaCy for entity extraction, scikit-learn for vectorisation) groups related articles by default; optional semantic clustering with OpenAI embeddings for higher-quality grouping.
3. **Synthesis** — LLM writes a briefing per story cluster. Multi-provider routing (Anthropic Claude, Google Gemini, OpenAI) with a circuit-breaker pattern falls over to the next provider on failure. Enrichments add social pulse (Hacker News reactions), expert voice (attributed quotes), and confidence indicators.
4. **Post-processing** — story threading attaches new items to existing threads or suppresses near-duplicates; a corrections layer flags cross-story contradictions.
5. **Delivery** — personalised digests assembled from topic preferences and delivery schedules, sent via Resend. A weekly Saturday edition ("The Arc") covers longer-running threads for Plus-tier users.
6. **Operations** — a dashboard tracks pipeline metrics, deliverability, per-feature LLM usage, and alerts. Magic-link auth, reading lists, and delivery webhooks round out the product surface.

## Outcome

- Live at [thedigest.co](https://thedigest.co).
- 861 tests passing across the pipeline, delivery, and ops layers.
- Multi-provider fallback means synthesis continues when any single LLM provider has an outage.

## Links

- Live site: [thedigest.co](https://thedigest.co)
- GitHub: [github.com/deanem/digest](https://github.com/deanem/digest)

## Stack

Python, Flask, PostgreSQL, spaCy, scikit-learn, Anthropic Claude / Google Gemini / OpenAI, Resend
