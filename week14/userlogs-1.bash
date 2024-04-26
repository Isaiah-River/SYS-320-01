#! /bin/bash

authfile="/var/log/auth.log"

function getLogins(){
 logline=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser" 
}

function getFailedLogins(){
# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
 failedlogline=$(cat "$authfile" | grep "Failed password" | awk '{print $1 " " $2 " "$6}')
 echo "$failedlogline"
}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: isaiah.river@mymail.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp isaiah.river@mymail.champlain.edu

# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 

echo "To: isaiah.river@mymail.champlain.edu" > emailform2.txt
echo "Subject: Failed Logins" >> emailform2.txt
echo -e "\n\n" >> emailform2.txt
getFailedLogins >> emailform2.txt
cat emailform2.txt | ssmtp isaiah.river@mymail.champlain.edu
