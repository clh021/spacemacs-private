
# 代码补全
> 希望可以结合语法本身的补全和 tabnine


# 代理
```lisp
(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 1080 5))
```
也可以定义一个 toggle （spacemacs 自带有定义 toggle 的函数，可以用那个），需要的时候就打开，不需要就关闭。
实现很简单，不需要的时候，把 url-gateway-method 的值恢复为默认值就行了。
```lisp
(setq url-gateway-local-host-regexp
      (concat "\\`" (regexp-opt '("localhost" "127.0.0.1")) "\\'"))
```

```lisp
(defun dotspacemacs/user-init ()
   (setq url-proxy-services '(
                              ("http" . "www.xxx.com:8080")
                              ("https" . "www.xxx.com:8080")
                              ))
)
```
```lisp
;; Configure network proxy
;; https://emacs-china.org/t/topic/2808/24
(defun show-proxy ()
  "Show http/https proxy."
  (interactive)
  (if url-proxy-services
      (message "Current proxy is \"%s\"" my-proxy)
    (message "No proxy")))

(defun set-proxy ()
  "Set http/https proxy."
  (interactive)
  (setq url-proxy-services `(("http" . ,my-proxy)
                             ("https" . ,my-proxy)))
  (show-proxy))

(defun unset-proxy ()
  "Unset http/https proxy."
  (interactive)
  (setq url-proxy-services nil)
  (show-proxy))

(defun toggle-proxy ()
  "Toggle http/https proxy."
  (interactive)
  (if url-proxy-services
      (unset-proxy)
    (set-proxy)))
```
https://github.com/stardiviner/proxy-mode

# 快捷键


```
文件tree操作
按键	对应的操作
?	查看帮助
cf	新建文件
cd	新建目录
R	重命名
q	隐藏/显示 treemacs 目录
Q	退出 treemasc
ov	垂直分屏来打开一个文件
oh	水平分屏来打开一个文件
th	隐藏或显示隐藏的文件
m	移动一个文件

tab-bar-mode
tab-bar-switch-to-tab 根据名字来切换标签
tab-bar-switch-to-recent-tab 切换到最近的标签
tab-bar-switch-to-next-tab 切换到下一个标签
tab-bar-close-tab 关闭标签
tab-bar-new-tab 新建标签


窗口
命令	快捷键	描述
evil-window-left	SPC w h	切换到左边的窗口
evil-window-down	SPC w j	切换到下面的窗口
evil-window-up	SPC w k	切换到上面的窗口
evil-window-right	SPC w l	切换到右边的窗口
快速删除窗口
Emacs 中可以使用 C-x 0 来删除一个窗口，Spacemacs 中也可以使用 SPC w d 来删除一个窗口
如果你希望删除窗口的同时删除对应的 buffer，可以使用 kill-buffer-and-window SPC w x
快速转换分屏类型
如果要将上下或左右分屏的窗口转换为另一个类型，可以使用 window-layout-toggle SPC w + 
它可以位于焦点上的上下分屏转换为左右分屏，将左右分屏转换为上下分屏

快速定位
跳转到指定字符    SPC j j [char]
跳转到指定行      SPC j t
跳转到定义/引用   SPC m g d

搜索
搜索当前文件字符串      SPC s s
搜索项目中的文件        SPC p f
// 使用grep，性能好，适合大文件
<spc> s g b 对当前打开的所有buffers
<spc> s g g 对当前文件
// 使用ag，性能更好
<spc> s a b 对当前打开的所有buffers
<spc> s a a 对当前文件
Emacs 快捷键的用户一般可以通过 C-x C-f 来查找文件
命令	快捷键	描述
counsel-find-file	SPC f f	使用 counsel 来查找文件
find-file-literally	SPC f l	使用一个更轻量的工具来查找文件
counsel-rencentf	SPC f r	使用 counsel 来查找最近打开的文件

替换
逐一询问替换字符串 M-%
逐一询问替换匹配正则表达式的字符串 C-M-%
替换项目内的字符串                SPC p R
正则替换项目内的字符串                SPC p %
M-x replace-string

编辑
u 撤销
C-r 重做

g c c 注释、反注释
快速插入代码片段              SPC i s
sudo -E emacs <filename> 来保留用户环境并加载当前用户（而不是 root 用户）的 Emacs 配置
命令	快捷键	描述
rename-current-buffer-file	SPC f R	重命名当前的文件
insert-file	SPC f i	将另一个文件中的内容插入到当前文件
save-buffer	SPC f s	保存当前的 buffer
save-as	SPC f c	另存为...文件
delete-current-buffer-file	SPC f D	删除当前 buffer 的文件
命令	快捷键	描述
copy-buffer-name	SPC f y b	复制当前 buffer 名
copy-file-name	SPC f y n	复制当前文件名
copy-file-path	SPC f y y	复制当前文件的路径
快捷键	描述
SPC SPC	相当于 Emacs 编辑模式中的 M-x
SPC TAB	快速回到上一个 buffer
SPC !	用于临时执行 shell 命令
SPC '	启动系统的默认终端
SPC *	在项目的所有文件中搜索光标所在处的单词
SPC /	在项目的所有文件中搜索指定字符串（跟上一个功能一样）
SPC 0	把焦点转到 Treemacs 栏中（如果开启了 Treemacs 的话）
SPC 1..9	快速切换对应序号的窗口，范围为 1 至 9
SPC ;	快速注释当前行（按完后，还要再按一次 ; 进行确认）
SPC ?	列出所有的快捷键
SPC `	通过序号来切换窗口

手册
manual手册                    SPC h m
函数说明
变量说明


终端
打开eshell                    SPC !
打开系统的 shell               SPC '

Git
查看当前文件的修改记录       SPC g b
文件时光机                 SPC g t
    n   向后一个版本
    N/p 向前一个版本
    Y   拷贝当前版本的 git hash 值
    q   退出
让单个文件回到某个版本       
Git staged 当前文件        SPC g S
Git unstaged 当前文件      SPC g U
Git St 窗口               SPC g s
Untracked files
s 将该文件加入 unStage files 列表即 unstage 区，相当于命令行上的 git add [filename]。 
x 忽略该文件修改。 TAB 查看 diff q 返回
Unstaged files
u 撤销，即将该文件撤回到 Untracked 区。 TAB 查看 diff q 返回
    y    查看 refs
    b    管理 branch
        m m  Merge Action
        b    切换分支
    c c   提交
    P m   Push
    l l   Log
        d r   Diff
    f u   Fetch
    F u   Pull


重构

```
