Git
全局配置
git config --global user.name crperlin  #git的用户名
git config --global user.email crper@outlook.com  #git的登录账号
git config --global core.editor vim  #设置默认编辑器
git config --global merge.tool vimdiff #设置默认的对比文件差异工具
git config --global color.status auto #显示颜色信息
git config --global color.branch auto #显示颜色信息
git config --global color.interactive auto #显示颜色信息
git config --global color.diff auto #显示颜色信息
git config --global push.default simple #简化提交
git config --list#查看配置的信息

git help config#获取帮助信息

配置SSHKEY
配置这货的好处就是可以省去提交的时候每次都输入账号密码；减少重复工作！
不管是github还是一些基于gitlab的托管社区，配置这个都是大同小异，在个人账户那里找到SSH-KEYGEN
ssh-keygen -t rsa -C crper@outlook.com #生成密钥，也可以通过图形工具生成，看个人喜好

ssh -T git@github.com #测试链接github是否成功，其他社区域名不同罢了

git status 查看更改
git add 添加要提交的文件，提交到缓存区
git commit 提交文件至版本库
git commit -m "提交备注"
git commit -a -m ""   连写方式
撤销：
git reset HEAD <file.name>  从缓存区撤销回工作区
git checkout -- <file.name> 从工作区撤销回版本库最近的版本
git commit --amend   重新提交，合并一次提交方案

git diff 比较更改文件工作区与暂存区的区别
git diff --cached / git diff --staged   暂存区与版本库之间的区别
git diff <分支名>   版本库与工作区比较

删除：
git rm <file.name> 删除暂存区文件