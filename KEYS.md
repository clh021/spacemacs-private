# 快捷键
```
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


手册
manual手册                    SPC h m
函数说明
变量说明


终端
打开eshell                    SPC !

Git提交


重构

```
