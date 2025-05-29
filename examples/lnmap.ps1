param (
	[Parameter()]
		[string]$cmd = "C:\Program Files (x86)\Nmap\nmap.exe",
	[Parameter()]
		[string]$args = "--min-hostgroup 96 -T4 -sV --version-all -O --osscan-guess -Pn -A -vvv -n --open -oX result-%Y%m%d-%H%M%S.xml"
)
try {
	$interfaces = Get-NetAdapter -Name "*" -Physical | Where-Object -FilterScript {$_.Status -eq "Up"}
	$addresses = $interfaces | Get-NetIPAddress | Where-Object -FilterScript { $_.AddressFamily -eq "IPv4" }
	$blocks = $addresses | Where-Object -FilterScript { $_.IPAddress -and $_.PrefixLength }
	foreach ( $i in $blocks ) {
		$args += " " + $i.IPAddress + "/" + $i.PrefixLength
	}
	Start-Process $cmd -ArgumentList $args -Wait -NoNewWindow
} catch {
	"$($_.InvocationInfo.ScriptLineNumber): $($Error[0])"
}