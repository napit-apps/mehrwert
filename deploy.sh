bundle exec jekyll clean
bundle exec jekyll build 

git checkout deployment

rm -r _site/tag
rm -r _site/en/tag

rm -r assets/
rm -r en/
rm -r testimonials/
rm -r trainings/

mv _site/* .

print "Update done... need to commit and push"


