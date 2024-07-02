#!/bin/sh

echo "pasting in copy of config file"
cp /data/confluence.cfg.xml /var/atlassian/application-data/confluence/confluence.cfg.xml

echo "setting file permissions"
chmod a+w /var/atlassian/application-data/confluence/confluence.cfg.xml

echo "calling original entrypoint"
/entrypoint.py