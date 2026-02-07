---
title: Home
layout: default
---
<section class="hero panel">
  <p class="eyebrow">Hello, I'm Deane.</p>
  <h1>I build practical products that make work feel lighter.</h1>
  <p class="lede">
    I'm a developer focused on clean interfaces, strong systems, and honest communication.
    This site is my home base for projects, writing, and experiments.
  </p>
  <div class="hero-actions">
    <a class="button" href="{{ '/projects/' | relative_url }}">View Projects</a>
    <a class="button ghost" href="{{ '/blog/' | relative_url }}">Read Blog</a>
  </div>
</section>

<section class="panel">
  <div class="section-head">
    <h2>Featured Projects</h2>
    <a href="{{ '/projects/' | relative_url }}">See all</a>
  </div>
  <div class="card-grid">
    {% for project in site.data.projects limit:3 %}
      <article class="card">
        <p class="tag">{{ project.status }}</p>
        <h3>{{ project.name }}</h3>
        <p>{{ project.summary }}</p>
        <p class="small">{{ project.stack }}</p>
        <a href="{{ project.url }}" target="_blank" rel="noreferrer">Open Project</a>
      </article>
    {% endfor %}
  </div>
</section>

<section class="panel">
  <div class="section-head">
    <h2>Latest Writing</h2>
    <a href="{{ '/blog/' | relative_url }}">Browse posts</a>
  </div>
  {% if site.posts.size > 0 %}
    <ul class="clean-list">
      {% for post in site.posts limit:4 %}
        <li>
          <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
          <span>{{ post.date | date: "%b %-d, %Y" }}</span>
        </li>
      {% endfor %}
    </ul>
  {% else %}
    <p>No posts yet. Add your first post in <code>_posts/</code>.</p>
  {% endif %}
</section>
