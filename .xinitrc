systemctl --user import-environment
systemctl --user daemon-reload
systemctl --user start --wait xsession.target

