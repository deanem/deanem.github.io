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
      <p class="small"><strong>Stack:</strong> {{ project.stack }}</p>
      <a href="{{ project.url }}" target="_blank" rel="noreferrer">Open Project</a>
    </article>
  {% endfor %}
</div>
