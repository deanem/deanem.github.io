---
title: CPD Manager Suite Case Study
description: A three-plugin Moodle suite for end-to-end Continuing Professional Development tracking and compliance reporting.
layout: page
---
## Problem

Educational organisations running Moodle had no integrated way to manage Continuing Professional Development: learners logged activities in spreadsheets, managers chased approvals manually, and compliance reporting meant exporting data and stitching it together offline.

## Approach

Built as three composable Moodle plugins:

- **local_cpdmanager** — the base plugin. Learners submit CPD activities (workshops, conferences, courses, research, peer learning) with evidence file attachments. Managers work through a bulk approval queue. Requirements are defined with date ranges and hour targets, and progress is tracked visually with per-requirement progress bars. Scheduled tasks fire reminder notifications and create calendar deadline events.
- **local_cpdmanager_pro** — the pro-tier extension. Adds organisation-wide compliance reports via Moodle's native Report Builder, daily deadline-risk alerts configurable by days-to-deadline threshold, and automatic CPD activity creation and approval on course completion via a course-to-CPD-type mapping.
- **block_cpd** — a dashboard block giving learners an at-a-glance SVG donut-chart view of their requirement progress (approved vs pending vs target, colour-coded by status) and giving managers a team compliance summary with a pending-approvals badge.

The suite follows Moodle's privacy API (GDPR), uses standard capability checks for manager scoping, and requires no external dependencies beyond the host Moodle instance.

## Outcome

- Full CPD lifecycle covered: submission → approval → compliance reporting → automated course-credit → dashboard visibility.
- Managers handle approvals and view team compliance without leaving Moodle.
- Pro tier eliminates manual activity logging for course completions and automates deadline risk surfacing.

## Links

- Demo: [moodle.deanemccullough.com](https://moodle.deanemccullough.com)

## Stack

PHP, MySQL, Moodle
