---
title: Home
layout: default
---
<section class="hero">
  <p class="eyebrow">Hello, I'm Deane.</p>
  <h1>I build practical products that make work feel lighter.</h1>
  <div class="hero-foot">
    <p class="lede">This site is my home base for projects, writing, and experiments.</p>
    <div class="hero-actions">
      <a class="button" href="{{ '/projects/' | relative_url }}">View Projects</a>
      <a class="button ghost" href="{{ '/blog/' | relative_url }}">Read Blog</a>
    </div>
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
        <div class="card-links">
          {% if project.url %}
            <a href="{{ project.url }}" target="_blank" rel="noopener noreferrer">Visit Site</a>
          {% endif %}
          {% if project.github %}
            <a href="{{ project.github }}" target="_blank" rel="noopener noreferrer">GitHub</a>
          {% endif %}
          {% if project.case_study %}
            <a href="{{ project.case_study | relative_url }}">Read Case Study</a>
          {% endif %}
        </div>
      </article>
    {% endfor %}
  </div>
</section>

{% if site.posts.size > 0 %}
<section class="panel">
  <div class="section-head">
    <h2>Latest Writing</h2>
    <a href="{{ '/blog/' | relative_url }}">Browse posts</a>
  </div>
  <ul class="clean-list">
    {% for post in site.posts limit:4 %}
      <li>
        <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
        <span>{{ post.date | date: "%b %-d, %Y" }}</span>
      </li>
    {% endfor %}
  </ul>
</section>
{% endif %}
