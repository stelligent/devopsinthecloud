#!/bin/bash -v
# Change into your jenkins home.

cd /usr/share/tomcat6/.jenkins

# Add any new conf files, jobs, users, and content.
git add -f *.xml jobs/*/config.xml .gitignore

# Ignore things we don't care about
cat > .gitignore <<EOF
log
*.log
*.tmp
*.old
*.bak
*.jar
.*
plugins/
updates/
jobs/*/builds
jobs/*/last*
jobs/*/next*
jobs/*/*.csv
jobs/*/*.txt
jobs/*/*.log
jobs/*/workspace
EOF

# Remove anything from git that no longer exists in jenkins.
git status --porcelain | grep '^ D ' | awk '{print $2;}' | xargs -r git rm

# And finally, commit and push
git commit -m 'Automated commit of jenkins configuration' -a
#git push
