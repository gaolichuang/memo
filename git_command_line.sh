# get a repo
git clone git@github.com:gaolichuang/memo.git
# check branch
git branch

# create branch
git branch dev

# switch to dev branch
git branch dev

# merge from other branch to current branch
# example: now at master, merge from dev
git merge dev

# commit to local code base
git commit -m"add some"

# push local code to remote
git push orign master
git push orign dev


# step:
# first develop at dev branch, if it is good, merge to master
# then push  master to branch
# dev use to develop new feature
