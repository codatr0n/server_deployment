# server_deployment
documentation and script for my server deployments

### Add sudo to debian
1. Start becoming superuser with `su`. Enter your root password.
2. Now, install sudo with `apt-get install sudo`.
3. Add the user account to the group *sudo* with `/sbin/adduser *username* sudo`. Where *username* is your user account.
4. Now, log out and then log in with the same user.

### Download from Github and pipe to bash
`wget -O - https://raw.githubusercontent.com/<username>/<project>/<branch>/<path>/<file> | sh`

#### Debian
`wget -O - https://raw.githubusercontent.com/codatr0n/server_deployment/main/debian_docker.sh | sh`

#### Ubuntu
`wget -O - https://raw.githubusercontent.com/codatr0n/server_deployment/main/ubuntu_docker.sh | sh`