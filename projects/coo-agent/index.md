---
title: coo-agent Case Study
description: Designing a safety-first AI agent runtime with durable state, approval-gated actions, and role-isolated workers.
layout: page
---
## Problem

Running AI agents against real systems (codebases, APIs, external services) is high-stakes: a wrong action can create work, spend money, or send a message that can't be unsent. The common failure mode is an agent that either does too little (asks for approval on everything) or too much (acts autonomously without guardrails). The goal was a runtime that operates autonomously within well-defined policy boundaries and surfaces only the decisions that genuinely need a human.

## Approach

Built a Docker-first orchestration platform around a few core ideas:

- **Durable state** — all orchestration state lives in PostgreSQL. Runs, tasks, approvals, and events are append-only, so the full audit trail survives restarts and is queryable after the fact.
- **Approval-gated actions** — a policy layer classifies actions as risky (merge, deploy, outreach, secrets) and routes them to an approval inbox before execution. Safe actions proceed without interruption.
- **Bounded workers** — workers run in role-isolated containers (`dev`, `research`, `outreach`) with no-new-privileges, dropped capabilities, and read-only root filesystems. Each role has a constrained set of permitted actions.
- **Webhook-triggered tasks** — external systems create tasks via HMAC-signed webhooks with replay protection. API keys support rotation without downtime.
- **Observability** — Prometheus metrics export, SLO monitoring for run and approval latency, failure rates, and a Redis-backed leader election for orchestrator HA failover.
- **LLM abstraction** — litellm provides a single interface across providers, keeping the agent logic decoupled from any specific model.

The operator-facing surface includes a dashboard for active runs and an approval inbox for reviewing and acting on gated decisions.

## Outcome

- Foundation complete: durable state, approval workflow, bounded workers, webhook ingestion, and observability in place.
- Full operational autonomy (agent identifies and ranks feature work, generates specs, executes within policy) in progress.

## Links

- GitHub: [github.com/deanem/coo-agent](https://github.com/deanem/coo-agent)

## Stack

Python, FastAPI, PostgreSQL, Redis, RQ, SQLAlchemy, litellm, Docker
