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
# delete local branch
git branch -D <local-branch-name>

# 拿到nova代码
git clone https://github.com/openstack/nova.git
git branch -a
#创建remote地址cc，这个可以在一个clone出来的git库进行，使得一个git库关联多个远端
git remote add  cc gitolite@git.localhost:nova.git
# 创建一个cc/havana分支
 git checkout   remotes/origin/stable/havana -b cc/havana
# 把这个分支推到cc远端
 git push cc  cc/havana

# git create remote branch dev
git checkout -b dev
git add XXX
git commit XXX
git push origin dev # then will create remotes/origin/dev

#将远端的拉倒本地， 相当于svn up
git pull origin master

# 如何查看本地代码和远端是否一致   相当于svn st
:~/workspace/github/memo$ git branch -a # 看下有哪些分支
* master
  remotes/origin/HEAD -> origin/master
  remotes/origin/dev
  remotes/origin/master
:~/workspace/github/memo$ git diff master  origin/master   # 比较本分支和远端分支的区别


### git 初始化
git config --global user.name "gaolichuang"
git config --global user.email "lichuang.gao@chinacache.com"
mkdir XXX
cd XXX
git init
git remote add origin git@gitxxx.com:root/XXX.git

touch README.md
git add README.md
git commit -m "first commit"
git push -u origin master



####  modify remote url
git remote set-url origin git@192.168.20.181:ccos/neutron.git 


### Git ignore file mode (chmod) changes?
git config core.fileMode false

#### alias
git config --global alias.st status


#将某个文件的历史版本 checkout 到工作区
git checkout <sha1-of-a-commit> </path/to/your/file>
#有时候你需要将某个文件的历史版本 checkout 出来，并以一个新的名字保存。这时候可以这么做：
git checkout <sha1-of-a-commit>:</path/to/your/file> </new/name/of/the/file>


# switch from github to gitlab
git clone --mirror git@github.com:gaolichuang/neutron-fwaas.git
cd neutron-fwaas.git/
# add gitlab address
git remote add gitlab ssh://git@XX.XX.XX.XX:2222/ccos/neutron-fwaas.git
git push -f --tags gitlab refs/heads/*:refs/heads/*

# 创建分支，以kilo开始开发， 分支dev
git clone ssh://git@XX.XX.XX.XX:2222/ccos/neutron-fwaas.git
git checkout -b dev origin/stable/kilo
git push origin dev


# git add 后撤销
git add a.txt
git add b.txt
## 撤销b.txt
git reset HEAD b.txt


## 远程分支和本地分支不同名字， 如何push上去
# 本地分支叫dev， 远程分支叫develop

➜ git:(dev) >git push origin  HEAD:develop
Total 0 (delta 0), reused 0 (delta 0)
To git@github.com:xxx/ts.git
   9a30122..e183800  HEAD -> develop
➜ git:(dev) >git branch
* dev
  master
