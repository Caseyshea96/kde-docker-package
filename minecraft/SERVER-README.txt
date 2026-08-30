PAPER SERVER QUICK START

1. Read https://aka.ms/MinecraftEULA. If you agree, edit eula.txt to eula=true.
2. Double-click start.bat to launch the server.
3. At the server console, type stop to shut down cleanly.

Defaults: 2 GB initial memory, 4 GB maximum memory, port 25565.
To change memory for one PowerShell session:
  $env:PAPER_MIN_MEMORY='2G'
  $env:PAPER_MAX_MEMORY='6G'
  .\start.ps1

The existing world folder is used automatically. Back it up before starting this
Paper version if it came from an older Minecraft version; upgraded worlds cannot
generally be downgraded safely.

For players on this PC, connect to: localhost
For players on the same home network, connect to this PC's IPv4 address.
Internet access additionally requires a Windows Firewall rule and router port
forwarding for TCP 25565. Do not expose the port until you intend to host publicly.
