# About
Linux quick reference on some most used commands

- `chmod -R a+rX` : will recursively __append_ read/execute(rX) for all (a) ie. user/group/other directories (X) and append only read for files only. **NOTE** This will not change __dot__ files.
- `tar -o ...` : -o option will overwrite the ownership to the one who is untaring right now.
- `find . -type d -name .svn -exec rm -rf {}\;`
- `sudo -u <user> <command>` : Runs the `<command>` as user `<user>`
- `sudo -u <user> -g <group> <command>` : Runs the `<command>` as user `<user>` and the group `<group>` instead of the primary group of the user.
- `sudo sh -c "echo NISDOMAIN=vlsi.silicon.ac.in >> /etc/sysconfig/networks"` : Commands which have breaks in them are passed to a shell else after the first part, the rest will executed as the normal user and not sudoer.

