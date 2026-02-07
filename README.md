# Personal Site on GitHub Pages

This repo is set up as a GitHub Pages personal site with:

- **About** page (`/about/`)
- **Projects portfolio** page (`/projects/`)
- **Blog** page (`/blog/`) powered by Jekyll posts in `_posts/`

## Quick Start

1. Install Ruby + Bundler.
2. Install dependencies:

   ```bash
   bundle install
   ```

3. Run locally:

   ```bash
   bundle exec jekyll serve
   ```

4. Open `http://127.0.0.1:4000`.

## Customize

- Site-wide metadata: `_config.yml`
- Name, links, intro copy: `index.md` and `about/index.md`
- Portfolio items: `_data/projects.yml`
- Blog posts: `_posts/YYYY-MM-DD-title.md`
- Styles: `assets/css/style.css`

## Publish with GitHub Pages

Because this repo is named `deanem.github.io`, GitHub will publish it as your user site:

- Production URL: `https://deanem.github.io/`

Push to `main`, then in GitHub settings verify Pages is set to deploy from the repository source.
