#!/bin/sh
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/autobackup_leia
ssh-add ~/.ssh/gitKey
rsync -e 'ssh -p 22345' -avzp /etc/ r0653404@leia:~/backup-systeembeheer

