#clean build
bundle exec jekyll clean
bundle exec jekyll build 

git checkout deployment

#remove ununeeded stuff
rm -r _site/tag
rm -r _site/en/tag

#remove old stuff
rm -r assets/
rm -r en/
rm -r testimonials/
rm -r trainings/

mv _site/* .

#site update
git st
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


