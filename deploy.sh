npm install
rm -rf public
git clone --depth 1 https://$GITHUB_USER:$GITHUB_TOKEN@$DEPLOY_REPO --branch $DEPLOY_BRANCH $DEPLOY_DIR
hugo --config config.toml
cd $DEPLOY_DIR
ls
git config user.email "$GITHUB_EMAIL"
git config --global user.name "$GITHUB_USER"
git add -A
git commit -m "$COMMIT_MESSAGE"
git push origin $DEPLOY_BRANCH:$DEPLOY_BRANCH
