# PowerShell 执行策略 需先配置 用管理员权限 打开 powershell
# 输入以下代码  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
# 参考 https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-5.1&WT.mc_id=ps-gethelp



Add-Type -AssemblyName System.Windows.Forms
# 规则名称
$HearthstoneOfflineName = "HearthstoneOffline"

# display name
$HearthstoneOfflineDisplayName = "炉石一键拔线"

# 炉石地址 查找自己本地电脑炉石exe地址
$HearthstonePath = "G:\Blizzard\OverWatch\Hearthstone\Hearthstone.exe"

$HearthstoneOfflineRule = Get-NetFirewallRule -Name $HearthstoneOfflineName -ErrorAction SilentlyContinue

if ($HearthstoneOfflineRule -eq $null) {
  [System.Windows.Forms.MessageBox]::Show('开始初始化')
  # 新建规则
  New-NetFirewallRule -DisplayName $HearthstoneOfflineDisplayName -Name $HearthstoneOfflineName  -Direction Outbound -Program $HearthstonePath -Enable True  -Action Block
  [System.Windows.Forms.MessageBox]::Show('写入完成 炉石已断开连接')

}else {
  if($HearthstoneOfflineRule.Action -eq "Block") {
    # 联网
    Set-NetFirewallRule -Name $HearthstoneOfflineName -Action Allow
    [System.Windows.Forms.MessageBox]::Show('已开始连接 请等待几秒')
  }else {
    # 断网
    Set-NetFirewallRule -Name $HearthstoneOfflineName -Action Block
    [System.Windows.Forms.MessageBox]::Show('炉石已断开连接 请再次执行重新连接')
  }
}

# 如果存在问题可以用以下代码删除规则  
# Remove-NetFirewallRule -Name $HearthstoneOfflineName

# 或者在本地电脑 控制面板\系统和安全\Windows Defender 防火墙\高级设置\出站规则 下删除  '炉石一键拔线' 