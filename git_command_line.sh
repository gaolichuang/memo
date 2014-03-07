# get a repo
git clone git@github.com:gaolichuang/memo.git
# check branch
git branch

# create branch
git branch dev

# switch to dev branch
git branch dev

#删除本地分支
git branch -d dev

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

#首先, clone 一个远端仓库，到其目录下：

$ git clone git://example.com/myproject
$ cd myproject
#然后，看看你本地有什么分支：
$ git branch
* master
#但是有些其他分支你在的仓库里面是隐藏的，你可以加上－a选项来查看它们：

$ git branch -a
* master
  origin/HEAD
  origin/master
  origin/v1.0-stable
  origin/experimental
如果你现快速的代上面的分支，你可以直接切换到那个分支：

$ git checkout origin/experimental
但是，如果你想在那个分支工作的话，你就需要创建一个本地分支：

$ git checkout -b experimental origin/experimental
现在，如果你看看你的本地分支，你会看到：

$ git branch
    master
  * experimental
# list all branch include remote branch
 git branch -a
# delete remote branch   删除远端分支
git push origin --delete <branchName>
# delete tag
git push origin --delete tag <tagname>
