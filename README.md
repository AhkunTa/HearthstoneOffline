# HearthstoneOffline
炉石传说一键断线 powershell 脚本

## 1 首先 powershell 需先自己手动定义执行策略 

以管理员权限运行powershell 并在 powershell 输入以下代码
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
```
具体参考 [powershell help](https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-5.1&WT.mc_id=ps-gethelp)

## 2 下载 HearthstoneOffline.ps1 替换 *$HearthstonePath* 变量为自己本地炉石传说exe地址
$HearthstonePath = "G:\Blizzard\OverWatch\Hearthstone\Hearthstone.exe"


## 3 直接右键运行  
若有弹窗即启动成功 断开连接 再次右键脚本运行连接炉石 
若没有大概率 #1 未执行成功 

