# HearthstoneOffline
炉石传说一键断线 powershell 脚本

## 首先 powershell 需先自己手动定义执行策略 

在 powershell 输入以下代码
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```
具体参考 [powershell help](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-5.1&WT.mc_id=ps-gethelp)


## 炉石地址 查找自己本地电脑炉石exe地址替换 ps1文件中的 *$HearthstonePath* 变量
$HearthstonePath = "G:\Blizzard\OverWatch\Hearthstone\Hearthstone.exe"

## 下载 HearthstoneOffline.ps1 直接右键运行
