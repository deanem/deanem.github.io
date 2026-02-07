---
title: Projects
description: A portfolio of things I've built, tested, and learned from.
---
<div class="card-grid">
  {% for project in site.data.projects %}
    <article class="card">
      <p class="tag">{{ project.status }}</p>
      <h2>{{ project.name }}</h2>
      <p>{{ project.summary }}</p>
      {% if project.impact %}
        <p class="impact"><strong>Impact:</strong> {{ project.impact }}</p>
      {% endif %}
      <p class="small"><strong>Stack:</strong> {{ project.stack }}</p>
      <div class="card-links">
        <a href="{{ project.url }}" target="_blank" rel="noopener noreferrer">Open Project</a>
        {% if project.case_study %}
          <a href="{{ project.case_study | relative_url }}">Read Case Study</a>
        {% endif %}
      </div>
    </article>
  {% endfor %}
</div>
