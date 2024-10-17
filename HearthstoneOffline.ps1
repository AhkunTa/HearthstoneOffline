# PowerShell ִ�в��� �������� �ù���ԱȨ�� �� powershell
# �������´���  Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
# �ο� https://learn.microsoft.com/zh-cn/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-5.1&WT.mc_id=ps-gethelp



Add-Type -AssemblyName System.Windows.Forms
# ��������
$HearthstoneOfflineName = "HearthstoneOffline"

# display name
$HearthstoneOfflineDisplayName = "¯ʯһ������"

# ¯ʯ��ַ �����Լ����ص���¯ʯexe��ַ
$HearthstonePath = "G:\Blizzard\OverWatch\Hearthstone\Hearthstone.exe"

$HearthstoneOfflineRule = Get-NetFirewallRule -Name $HearthstoneOfflineName -ErrorAction SilentlyContinue

if ($HearthstoneOfflineRule -eq $null) {
  [System.Windows.Forms.MessageBox]::Show('��ʼ��ʼ��')
  # �½�����
  New-NetFirewallRule -DisplayName $HearthstoneOfflineDisplayName -Name $HearthstoneOfflineName  -Direction Outbound -Program $HearthstonePath -Enable True  -Action Block
  [System.Windows.Forms.MessageBox]::Show('д����� ¯ʯ�ѶϿ�����')

}else {
  if($HearthstoneOfflineRule.Action -eq "Block") {
    # ����
    Set-NetFirewallRule -Name $HearthstoneOfflineName -Action Allow
    [System.Windows.Forms.MessageBox]::Show('�ѿ�ʼ���� ��ȴ�����')
  }else {
    # ����
    Set-NetFirewallRule -Name $HearthstoneOfflineName -Action Block
    [System.Windows.Forms.MessageBox]::Show('¯ʯ�ѶϿ����� ���ٴ�ִ����������')
  }
}

# �������������������´���ɾ������  
# Remove-NetFirewallRule -Name $HearthstoneOfflineName

# �����ڱ��ص��� �������\ϵͳ�Ͱ�ȫ\Windows Defender ����ǽ\�߼�����\��վ���� ��ɾ��  '¯ʯһ������' 