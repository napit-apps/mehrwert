#!/usr/bin/env bash
set -e

retired_pages=(
  DDD-1-copy.html
  DDD-2-copy.html
  Golder-Master-Testing-copy.html
  green-coding-einfuehrung.html
  training-gsp.html
)

# Build and validate before touching the publishing branch.
bundle exec jekyll clean
JEKYLL_ENV=production bundle exec jekyll build --config _config.yml
python3 _scripts/check-site.py _site
for page in "${retired_pages[@]}"; do
    if [[ -e "_site/$page" || -e "_site/en/$page" ]]; then
        printf 'Retired page still present in the build: %s\n' "$page" >&2
        exit 1
    fi
done

git checkout deployment

# Replace the generated directories handled by the existing deployment.
rm -r -- assets/ en/ testimonials/ trainings/ services/
rsync -a _site/ ./

# These previously published URLs must use the site's 404 fallback.
rm -f -- "${retired_pages[@]}"

#site update
git status --short
read -p "Do you want to publish the changes? (yes/no): " response

if [[ "$response" =~ ^[Yy](es)?$ ]]; then
    git add --all
    git commit -am "updated content"
    git push
    echo "################ Deployment done ####################"
else
    git re
    git cl
    echo "################ Deployment aborted ####################"
fi

# Ensure we are back on main branch
git checkout main


