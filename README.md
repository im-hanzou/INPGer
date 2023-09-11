# INPGer | CVE-2022-4063 - InPost Gallery 
Automatic Mass Tool for checking vulnerability in CVE-2022-4063 - InPost Gallery < 2.1.4.1 - Unauthenticated LFI to RCE<br>Using GNU Parallel. You must have parallel for running this tool.<br>
- <b>If you found error like "$'\r': command not found" just do "dos2unix inpger.sh"</b>
# Install Parallel
- Linux : <code>apt-get install parallel -y</code><br>
- Windows : You can install WSL (windows subsystem linux) then do install like linux<br>if you want use windows (no wsl), install <a href="https://git-scm.com/download/win">GitBash</a> then do this command for install parallel: <br>
[#] <code>curl pi.dk/3/ > install.sh </code><br>[#] <code>sha1sum install.sh | grep 12345678 </code><br>[#] <code>md5sum install.sh </code><br>[#] <code>sha512sum install.sh </code><br>[#] <code>bash install.sh</code><br>
# How To Use
- [#] <code>bash inpger.sh yourlist.txt thread</code>
# Reference
- https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-4063
- https://wpscan.com/vulnerability/6bb07ec1-f1aa-4f4b-9717-c92f651a90a7
- https://github.com/advisories/GHSA-5rmh-7p7v-fmfc
